import { Controller } from "@hotwired/stimulus"
import validate from "validate.js"

export default class extends Controller {
    static targets = ["form", "input"]
    static values = { status: Boolean, }

    initialize() {
        this._constrains = {}
    };
    connect() {
        for (let inputTag of this.inputTargets) {
            if (inputTag.hasAttribute('data-constrain')) {
                this._constrains[inputTag.name] = JSON.parse(inputTag.getAttribute('data-constrain'))
                inputTag.removeAttribute('data-constrain')
            }
            if (!document.getElementById(`${inputTag.id}_feedback`)) {
                let feedBackTag = document.createElement('div')
                feedBackTag.classList.add("d-block", "invalid-feedback")
                feedBackTag.id = `${inputTag.id}_feedback`
                inputTag.parentNode.insertAdjacentElement('beforeend', feedBackTag)
            }
        }
    };
    disconnect() {
        document
            .querySelectorAll('div[id$="_feedback"]')
            .forEach(element => element.parentNode.removeChild(element))
    };
    getAttributesFor(attribute) {
        return attribute.match(/(^[^\[]+)(?=\[)|(([^\[\]]+)(?=\]))/g)
    };
    handleChange(e) {
        e.preventDefault();
        const field = { [e.target.name]: e.target.value }
        const constrains = { [e.target.name]: this._constrains[e.target.name] }
        let errors = validate(field, constrains)
        if (errors) {
            this.displayErrors(errors)
        } else {
            let inputTags = [e.target.name]
            this.removeErrors(inputTags)
        }
    }
    handleForm(e) {
        e.preventDefault();
        let errors = validate(this.formTarget, this._constrains)
        if (errors) {
            this.displayErrors(errors)
        } else {
            let inputTags = this.inputTargets.map(input => input.name)
            this.removeErrors(inputTags)
            this.formTarget.submit();
            this.disconnect()
        }
    };
    currentTarget(name) {
        return this.inputTargets.find(inputTag => inputTag.name === name)
    };
    currentFeedback(name) {
        let targetId = this.currentTarget(name).id
        return document.querySelector(`#${targetId}_feedback`)
    }
    displayErrors(errors) {
        if (!errors) return
        for (let inputName in errors) {
            const errorMsg = errors[inputName]
            const target = this.currentTarget(inputName)
            const feedback = this.currentFeedback(inputName)
            this.addClass(target, 'is-invalid')
            feedback.textContent = errorMsg.at(0)
            this.addClass(feedback, 'invalid-feedback')
        }
        this._errors = {}
    };
    removeErrors(inputTags) {
        if (!inputTags) return
        inputTags.forEach(inputName => {
            const target = this.currentTarget(inputName)
            const feedback = this.currentFeedback(inputName)
            this.addClass(target, 'is-valid')
            target.classList.remove('is-invalid')
            feedback.textContent = ""
            feedback.setAttribute('class', "")
        })
    }
    initalizeForm() {
        for (let inputTag of this.element) {
            if (inputTag.type !== 'hidden' || inputTag.type === 'submit') {
                if (inputTag.hasAttribute('data-constrain')) {
                    this._constrains[inputTag.name] = JSON.parse(inputTag.getAttribute('data-constrain'))
                    inputTag.removeAttribute('data-constrain')
                    inputTag.addEventListener('change', this.handleChange)
                }
            }
        }
        this.element.addEventListener('submit', this.handleForm)
    }
    addClass(target, className) {
        if (!target.classList.contains(className)) {
            target.classList.add(className)
        }
    }
    isEmpty(str) {
        return !str.trim().length;
    }
};
