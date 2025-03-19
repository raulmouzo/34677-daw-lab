class ProductCart {
    constructor(productId, variantId, description, price, brand, category, quantity, size, image, stock) {
        this.productId = productId;
        this.variantId = variantId;
        this.description = description;
        this.price = price;
        this.brand = brand;
        this.category = category;
        this.quantity = quantity;
        this.size = size;
        this.image = image;
        this.stock = stock;
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

function modifyProductQuantity(productId, variantId, quantity, stock) {
    productId = parseInt(productId);
    variantId = parseInt(variantId);
    quantity = parseInt(quantity);
    stock = parseInt(stock);

    console.log("Modifying product quantity: ", productId, variantId, typeof productId, quantity, typeof quantity);
    loadCart();

    // Find the product using productId and variantId
    let product = cart.find(product => product.productId === productId && product.variantId === variantId);

    if (!product) {
        alert("Product not found in cart");
        return;
    }

    console.log("quantity: ", quantity, "stock: ", stock);
    if (quantity > stock) {
        alert("No hay suficiente stock para ese producto");
        return;
    }

    if (isNaN(quantity) || quantity < 1) {
        removeProductFromCart(productId, variantId);
    } else {
        product.quantity = quantity;
        saveCart();
        renderCartItems();
    }
}

function addProductToCart(productId, variantId, description, price, brand, category, size, image, stock) {
    loadCart();
    productId = parseInt(productId);
    variantId = parseInt(variantId);
    stock = parseInt(stock);

    // Check if the product already exists using both productId and variantId
    let product = cart.find(product => product.productId === productId && product.variantId === variantId);

    if (product) {
        modifyProductQuantity(productId, variantId,product.quantity + 1, stock);
    } else {
        product = new ProductCart(productId, variantId, description, price, brand, category, 1, size, image, stock);
        console.log(product.stock)
        cart.push(product);
        saveCart();
        renderCartItems();
    }

    if (product && product.quantity <= product.stock) {
        // Show cart alert
        new bootstrap.Offcanvas(document.querySelector('#offcanvasRight')).show();
        let cartAlert = document.getElementById("cart-alert");
        cartAlert.classList.remove("d-none");
        cartAlert.classList.add("show");
        setTimeout(() => {
            hideCartAlert();
        }, 3000);
    }
}

function removeProductFromCart(productId, variantId) {
    productId = parseInt(productId);
    variantId = parseInt(variantId);
    console.log("Removing product from cart: ", productId, variantId, typeof productId);
    loadCart();

    // Find the product by productId and variantId
    const index = cart.findIndex(p => p.productId === productId && p.variantId === variantId);
    if (index !== -1) {
        cart.splice(index, 1);
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
    let total = 0;
    const cartItemsContainer = document.getElementById("cartItems");
    cartItemsContainer.innerHTML = "";
    updateCartCount();

    if (cart.length === 0) {
        document.getElementById("cart-total").textContent = total.toFixed(2) + " €";
        cartItemsContainer.innerHTML = "<p>Tu cesta está vacía</p>";
        return;
    }
    

    cart.forEach(product => {
        const productElement = document.createElement("div");
        productElement.classList.add("cart-item");
        
        const productTotal = product.price * product.quantity;
        total += productTotal;

        productElement.innerHTML = `
            <div class="image-wrapper">
                <img src="${product.image}" alt="Product image">
            </div>
            <div class="item-info">
                <h4>${product.description}</h4>
                <p class="item-brand">${product.brand}</p>
                <p class="item-price">${productTotal.toFixed(2)} €</p>
                <p class="item-size">${product.size}</p>
                <div class="control-elements">
                    <div class="input-group quantity">
                        <button type="button" class="btn border-0 p-0 icon" data-type="minus" aria-label="Decrease quantity" onclick="modifyProductQuantity('${product.productId}', '${product.variantId}', ${product.quantity - 1}, ${product.stock})">
                            <box-icon name='minus' size="20px"></box-icon>
                        </button>
                        <input type="number" name="quantity" class="form-control input-number border-0 text-center" value="${product.quantity}" min="1" max="100" aria-label="Product quantity" onchange="modifyProductQuantity('${product.productId}', '${product.variantId}', this.value, ${product.stock})">
                        <button type="button" class="btn border-0 p-0 icon" data-type="plus" aria-label="Increase quantity" onclick="modifyProductQuantity('${product.productId}', '${product.variantId}', ${product.quantity + 1}, ${product.stock})">
                            <box-icon name='plus' size="20px"></box-icon>
                        </button>
                    </div>
                    <div class="delete">
                        <button type="button" class="btn btn-danger" aria-label="Remove product" onclick="removeProductFromCart('${product.productId}', '${product.variantId}')">
                            <box-icon type='solid' name='trash-alt' size="20px" color="#fff"></box-icon>
                        </button>
                    </div>
                </div>
            </div>
        `;
        cartItemsContainer.appendChild(productElement);
    });
    document.getElementById("cart-total").textContent = total.toFixed(2) + " €";
}

function renderCheckoutItems() {
    loadCart();
    const checkoutItemsContainer = document.getElementById("checkout-items");
    checkoutItemsContainer.innerHTML = "";
    let total = 0;

    if (cart.length === 0) {
        checkoutItemsContainer.innerHTML = "<p>Tu carrito está vacío.</p>";
        document.getElementById("checkout-total").textContent = "0 €";
        return;
    }

    cart.forEach(product => {
        const productElement = document.createElement("div");
        productElement.classList.add("cart-item");

        const productTotal = product.price * product.quantity;
        total += productTotal;

        productElement.innerHTML = `
            <div class="image-wrapper">
                <img src="${product.image}" alt="Imagen del producto">
            </div>
            <div class="item-info">
                <h4>${product.description}</h4>
                <p class="item-brand">${product.brand}</p>
                <p class="item-price">${product.price.toFixed(2)} €</p>
                <p class="item-size">${product.size}</p>
                <p class="item-quantity">Cantidad: ${product.quantity}</p>
                <p class="item-total">Total: ${productTotal} €</p>
            </div>
        `;

        checkoutItemsContainer.appendChild(productElement);
    });

    document.getElementById("checkout-total").textContent = total.toFixed(2) + " €";
}



function updateCartCount() {
    const totalQuantity = cart.reduce((sum, product) => sum + product.quantity, 0);
    document.getElementById("shopping-cart-counter").textContent = totalQuantity > 0 ? totalQuantity : "";
}

function hideCartAlert() {
    let cartAlert = document.getElementById("cart-alert");
    cartAlert.classList.remove("show");
    cartAlert.classList.add("d-none");
}

function goToCheckOut() {
    if (cart.length === 0) {
        alert("Tu carrito está vacío.");
        return;
    } else {
        window.location.href = "login.jsp?next=checkout.html";
    }
}
