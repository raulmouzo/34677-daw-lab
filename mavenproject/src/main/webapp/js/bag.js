class ProductCart {
    constructor(id, description, price, brand, category, quantity, image) {
        this.id = id;
        this.description = description;
        this.price = price;
        this.brand = brand;
        this.category = category;
        this.quantity = quantity;
        this.image = image;
    }
}

var cart = null;

function loadCart() {
    if (cart === null) {
        cart = JSON.parse(localStorage.getItem("stored-cart")) || [];
    }
}

function saveCart() {
    localStorage.setItem("stored-cart", JSON.stringify(cart));
}

function modifyProductQuantity(id, quantity) {
    id = parseInt(id);
    quantity = parseInt(quantity);
    
    console.log("Modifying product quantity: ", id, typeof id, quantity, typeof quantity);
    loadCart();
    let product = cart.find(product => product.id === id);

    if (!product) {
        alert("Producto no encontrado en el carrito");
        return;
    }

    if (isNaN(quantity) || quantity < 1) {
        removeProductFromCart(id);
    } else {
        product.quantity = quantity;
        saveCart();
        renderCartItems(); 
    }
}

function addProductToCart(id, description, price, brand, category, image) {
    loadCart();

    let existingProduct = cart.find(product => product.id === id);
    if (existingProduct) {
        modifyProductQuantity(id, existingProduct.quantity + 1);
    } else {
        let product = new ProductCart(id, description, price, brand, category, 1, image);
        cart.push(product);
        saveCart();
        new bootstrap.Offcanvas(document.querySelector('#offcanvasRight')).show();
        renderCartItems(); 
    }
}

function removeProductFromCart(id) {
    id = parseInt(id);
    console.log("Removing product from cart: ", id, typeof id);
    loadCart();
    const index = cart.findIndex(p => p.id === id);
    if (index !== -1) {
        cart.splice(index, 1);
        console.log(cart)
        saveCart();
        renderCartItems();    
    }
}


function clearCart() {
    cart = [];
    localStorage.removeItem("stored-cart");
    renderCartItems(); 
}


function renderCartItems() {
    loadCart();
    const cartItemsContainer = document.getElementById("cartItems");
    console.log(cartItemsContainer);
    cartItemsContainer.innerHTML = "";

    if (cart.length === 0) {
        cartItemsContainer.innerHTML = "<p>Tu carrito está vacío</p>";
        return;
    }

    cart.forEach(product => {
        const productElement = document.createElement("div");
        productElement.classList.add("cart-item");

        productElement.innerHTML = `
            <div class="image-wrapper">
            <!-- <img src="${product.image}" alt="Imagen de producto"> -->
            </div>
            <div class="item-info">
                <h4>${product.description}</h4>
                <p class="item-brand">${product.brand}</p>
                <p class="item-price">${product.price} €</p>
                <p class="item-size">${product.category}</p>
                <div class="control-elements">
                    <div class="input-group quantity">
                        <button type="button" class="btn border-0 p-0 icon" data-type="minus" aria-label="Disminuir cantidad" onclick="modifyProductQuantity('${product.id}', ${product.quantity - 1})">
                            <box-icon name='minus' size="20px"></box-icon>
                        </button>
                        <input type="number" name="quantity" class="form-control input-number border-0 text-center" value="${product.quantity}" min="1" max="100" aria-label="Cantidad del producto" onchange="modifyProductQuantity('${product.id}', this.value)">
                        <button type="button" class="btn border-0 p-0 icon" data-type="plus" aria-label="Aumentar cantidad" onclick="modifyProductQuantity('${product.id}', ${product.quantity + 1})">
                            <box-icon name='plus' size="20px"></box-icon>
                        </button>
                    </div>
                    <div class="delete">
                        <button type="button" class="btn btn-danger" aria-label="Eliminar producto" onclick="removeProductFromCart('${product.id}')">
                            <box-icon type='solid' name='trash-alt' size="20px" color="#fff"></box-icon>
                        </button>
                    </div>
                </div>
            </div>
        `;

        cartItemsContainer.appendChild(productElement);
    });
}
