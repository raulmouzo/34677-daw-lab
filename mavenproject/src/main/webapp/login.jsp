<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,shop.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Iniciar sesión</title>
    <link rel="icon" href="img/blint_icon.png" type="image/png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/login.css">

</head>

<body>
    <my-header class="sticky-top"></my-header>

    <%
        String next = request.getParameter("next");
        String message = (String) session.getAttribute("message");
        
        if (next == null) {
            next = "index.jsp";
        }
        if (message != null) {
            session.removeAttribute("message");
    %>
    <div class="alert alert-danger" role="alert">
        <%= message %>
    </div>
    <%
    }
    %>

    <%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null || userId <= 0) {
    %>
    <main>
        <div class="container">
            <h1>Iniciar sesión</h1>
            <div class="login-register">
                <div class="login">
                    <h2>INICIAR SESIÓN</h2>
                    <form action="login" method="post">
                        <input type="hidden" name="next" value="<%= (next != null) ? next : "" %>">
                        <div class="mb-3">
                            <label for="userInput" class="form-label">Usuario</label>
                            <input type="text" class="form-control" id="userInput" name="user" required aria-describedby="usuarioAyuda">
                            <div id="usuarioAyuda" class="form-text">Nunca compartiremos tu usuario con nadie más.</div>
                        </div>
                    
                        <div class="mb-3">
                            <label for="PassInput" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" id="PassInput" name="pass" required>
                        </div>
                    
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="rememberCheck" name="remember">
                            <label class="form-check-label" for="rememberCheck">Recuérdame</label>
                        </div>
                    
                        <button type="submit" class="btn btn-outline-secondary login-btn">Iniciar sesión</button>
                    </form>
                    
                </div>
                <div class="register">
                    <h2>¿NO TIENES CUENTA? REGÍSTRATE</h2>
                    <ul class="list-unstyled">
                        <li class="d-flex align-items-center mb-3">
                            <box-icon type='solid' name='package' size="33px" color="#6f3939"></box-icon>
                            <span>Sigue cada paso de tu pedido en tiempo real</span>
                        </li>
                        <li class="d-flex align-items-center mb-3">
                            <box-icon name='archive-in' size="33px" color="#6f3939"></box-icon>
                            <span>Guarda tus datos y compra en un clic, sin complicaciones</span>
                        </li>
                        <li class="d-flex align-items-center mb-3">
                            <box-icon name='log-out-circle' size="33px" color="#6f3939"></box-icon>
                            <span>Gestiona devoluciones fácilmente, sin estrés</span>
                        </li>
                    </ul>

                    <a href="registration.html" class="btn btn-outline-secondary register-btn" role="button">Crear
                        cuenta</a>

                </div>
                <a href="registration.html" class="btn btn-outline-secondary register-btn register-mobile"
                    role="button">Crear cuenta</a>
            </div>
        </div>
        <%
        } else {
            response.sendRedirect(next);
        }
        %>
    </main>
    <my-footer></my-footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <script src="js/base.js"></script>
    <script src="js/shoppingCart.js"></script>
</body>

</html>