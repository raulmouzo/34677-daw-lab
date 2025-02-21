class HeaderComponent extends HTMLElement {
    constructor() {
        super();
    }

    async connectedCallback() {
        const response = await fetch('header.html');
        const content = await response.text();
        this.innerHTML = content;
    }
}
window.customElements.define('my-header', HeaderComponent);

class FooterComponent extends HTMLElement {
    constructor() {
        super();
    }

    async connectedCallback() {
        const response = await fetch('footer.html');
        const content = await response.text();
        this.innerHTML = content;
    }
}
window.customElements.define('my-footer', FooterComponent);
