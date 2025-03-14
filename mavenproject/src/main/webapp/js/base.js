class HeaderComponent extends HTMLElement {
    constructor() {
        super();
    }

    async connectedCallback() {
        const response = await fetch('header.html');
        const content = await response.text();
        this.innerHTML = content;
        const cartItemsContainer = document.getElementById("cartItems");

        if (cartItemsContainer) {
            renderCartItems();
        }
    }
    
}
window.customElements.define('my-header', HeaderComponent);

const primaryHeader = document.querySelector('my-header');
const scrollWatcher = document.createElement('div');

scrollWatcher.setAttribute('data-scroll-watcher', '');
primaryHeader.before(scrollWatcher);

const navObserver = new IntersectionObserver((entries) => {
    primaryHeader.classList.toggle('sticking', !entries[0].isIntersecting);

});

navObserver.observe(scrollWatcher);


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
