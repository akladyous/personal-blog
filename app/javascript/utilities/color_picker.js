import Trix from "trix";

addEventListener("trix-initialize", function (event) {
    new ColorPicker(event.target);
});

Array.from([
    "rgb(255, 0, 0)",
    "rgb(0, 255, 0)",
    "rgb(0, 0, 255)",
    "rgb(255, 0, 255)",
    "rgb(0, 255, 255)",
    "rgb(255, 255, 0)",
    "rgb(255, 128, 0)",
    "rgb(128, 0, 255)",
    "rgb(128, 128, 128)",
]).forEach((color, i) => {
    Trix.config.textAttributes[`color${i + 1}`] = {
        style: { color: color },
        inheritable: true,
        parser: (e) => e.style.color == color,
    };
});

class ColorPicker {
    constructor(element) {
        this.element = element;
        this.insertColorPickerButton();
        this.insertColorPickerDialog();
    }

    insertColorPickerButton() {
        this.element.toolbarElement
            .querySelector("[data-trix-button-group=text-tools")
            .insertAdjacentHTML("beforeend", this.colorPickerButton);
    }

    insertColorPickerDialog() {
        this.element.toolbarElement
            .querySelector("[data-trix-dialogs")
            .insertAdjacentHTML("beforeend", this.colorPickerDialog);
    }

    get colorPickerButton() {
        return `
        <button type="button"
            class="trix-button"
            data-trix-action="selectColor"
            title="Select a color"
            tabindex="-1">
            Color
        </button>`;
    }

    colorPickerDialogButtons() {
        let string = "";
        Array.from([
            "color1",
            "color2",
            "color3",
            "color4",
            "color5",
            "color6",
            "color7",
            "color8",
            "color9",
        ]).forEach((color) => {
            string += `<button type="button"
            class="trix-button trix-button--dialog"
            data-trix-attribute="${color}"
            data-trix-method="hideDialog"></button>`;
        });
        return string;
    }

    get colorPickerDialog() {
        return `<div class="trix-dialog trix-dialog--color"
        data-trix-dialog="selectColor"
        data-trix-dialog-attribute="selectColor">
            <div class="trix-button-group">
            ${this.colorPickerDialogButtons()}
            </div>
        </div>`;
    }
}
