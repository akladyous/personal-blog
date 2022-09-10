import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["imageContainer", "input", "output"]
    connect() {
    }

    triggerUpload(event) {
        event.preventDefault();
        this.inputTarget.click()
    }
    handleChange(event) {
        let input = this.inputTarget;
        let output = this.outputTarget;

        let fileReader = new FileReader();
        if (input.files[0]) {
            fileReader.onload = () => {
                output.src = fileReader.result;
            };
        }
        fileReader.readAsDataURL(input.files[0])
    };
}
