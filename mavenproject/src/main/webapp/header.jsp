<header>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <box-icon name='menu' size="2.2rem" color="gray"></box-icon>
            </button>
            <a class="navbar-brand" href="index.jsp">
                <img src="img/blint_logo.png" alt="blint logo" class="d-inline-block align-text-top">
            </a>

            <div class="collapse navbar-collapse order-lg-3 order-4" id="navbarNavDropdown">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Productos
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="product_hoodies.html">Sudaderas</a></li>
                            <li><a class="dropdown-item" href="product_t-shirts.html">Camisetas</a></li>
                            <li><a class="dropdown-item" href="product_pants.html">Pantalones</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about_us.html">Sobre nosotros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">Contacto</a>
                    </li>
                </ul>
            </div>
            <ul class="navbar-nav custom-icons order-lg-4 order-3">
                <li>
                    <button class="nav-link icon" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                        <box-icon name='shopping-bag' type='solid' color='#6F3939'></box-icon>
                        <span class="visually-hidden">Cesta</span>
                        <div class="shopping-cart-counter" id="shopping-cart-counter"></div>
                    </button>
                </li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link icon dropdown-toggle" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        <box-icon type="solid" name="user" color='#6F3939'></box-icon>
                        <span class="visually-hidden">Usuario</span>
                    </a>
                
                    <ul class="dropdown-menu dropdown-menu-end">
                        <%
                            Integer userId = (Integer) session.getAttribute("userId"); 
                            if (userId == null || userId <= 0) { 
                        %>
                            <li><a href="login.jsp?next=profile.html" class="dropdown-item">Iniciar sesión</a></li>
                        <%
                            } else { 
                                String userName = (String) session.getAttribute("userName"); 
                                if (userName == null) userName = "Usuario"; 
                        %>
                            <li><span class="dropdown-item-text fw-bold"><%= userName %></span></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a href="profile.html" class="dropdown-item">Perfil</a></li>
                            <li><a href="logout.jsp" class="dropdown-item text-danger">Cerrar sesión</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <header>
        <div id="cart-alert" class="alert alert-success d-none" role="alert">
            Producto añadido al carrito
        </div>

        <div class="offcanvas-header">
            <h3 class="offcanvas-title" id="offcanvasRightLabel">Cesta</h3>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
    </header>
    
    <div class="offcanvas-body">
        <div class="cart-box">
            <div class="items" id="cartItems"></div>
            <div class="under-cart">
                <div class="total">
                    <p>Total</p>
                    <p id="cart-total">0 €</p>
                </div>
                <div class="buttons">
                    <button type="button" class="btn btn-primary" onclick="goToCheckOut()">Checkout</button>
                    <button type="button" class="btn btn-secondary" onclick="clearCart()">Vaciar</button>
                </div>
            </div>
        </div>
    </div>
</div>