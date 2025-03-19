<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,shop.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>blint - Pantalones</title>
	<link rel="icon" href="img/blint_icon.png" type="image/png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="css/product.css">
	<link rel="stylesheet" href="css/base.css">
</head>

<body>
    <%
        String categoryParam = request.getParameter("cat");
        int category = (categoryParam != null) ? Integer.parseInt(categoryParam) : 1;
	    DBAccess conn=DBAccess.getInstance();
	    List<DBProduct> products = conn.getProductsByCategory(category);
    %>

	<my-header class="sticky-top"></my-header>
	<main>
		<div class="container">
			<section class="row prd">
                <% if (category == 1) { %>
                <h1 class="mt-4 mb-3">Sudaderas</h1>
                <% } else if (category == 2) { %>
                <h1 class="mt-4 mb-3">Camisetas</h1>
                <% } else if (category == 3) { %>
                <h1 class="mt-4 mb-3">Pantalones</h1>
                <% } %>

                <% for (DBProduct product : products) { 
                    int productId = product.getId();
                    String description = product.getDescription();
                    double price = product.getPrice();
                    String brand = product.getBrand();
                    List<String> images = product.getImages();
                    List<DBVariant> variants = conn.getVariantsByProduct(productId);
                %>
                    <article class="col-sm-12 col-md-6 col-lg-3">
                        <div class="card">
                            <div id="prd-<%= productId %>" class="carousel slide img-prd">

                                <div class="carousel-inner">
                                    <% 
                                        int index = 0;
                                        for (String image : product.getImages()) {
                                            String activeClass = (index == 0) ? "active" : "";
                                    %>
                                    <div class="carousel-item <%= activeClass %>">
                                        <img src="img/<%= image %>" class="d-block w-100" alt="Imagen de producto">
                                    </div>
                                    <% 
                                        index++;
                                    }
                                    %>
                                    <%if (images.isEmpty()){ %>
                                        <div class="carousel-item active">
                                            <img src="img/default.png" class="d-block w-100" alt="Imagen de producto">
                                        </div>
                                    <%}%>

                                </div>

                                <button class="carousel-control-prev" type="button" data-bs-target="#prd-<%= productId %>"
                                    data-bs-slide="prev">
                                    <box-icon name='chevron-left' color="black" size="70px"></box-icon>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#prd-<%= productId %>"
                                    data-bs-slide="next">
                                    <box-icon name='chevron-right' color="black" size="70px"></box-icon>
                                    <span class="visually-hidden">Next</span>
                                </button>
                                <button class="icon-button" aria-label="Open sizes" onclick="showSizes(this)">
                                    <box-icon name="plus-circle" size="md" color="#55555569" type="solid"></box-icon>
                                </button>
                                <div class="sizes">
                                    <% for (DBVariant variant : variants) { 
                                        int variantId = variant.getId();
                                        int stock = variant.getStock();
                                        String size = variant.getSizeLabel();
                                    %>
                                
                                    <% if (stock <= 0) { %>
                                    <button type="button" class="ticked-size" disabled><%= size %></button>
                                    <% } else { %>
                                    <button type="button"
                                            onclick="addProductToCart(<%= productId %>, <%= variantId %>, '<%= description %>', <%= price %>, '<%= brand %>', <%=category%>,'<%=size%>' ,'img/<%= (images.isEmpty() ? "default.png" : images.get(0)) %>', <%=stock%>)">
                                            <%= size %>
                                    </button>
                                    <% } %>
                                <% } %>    
                                </div>                            
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <h3 class="card-title"><%=description%></h3>
                                    <p class="card-text"><%=brand%></p>
                                    <span><%=price%> €</span>
                                </div>
                            </div>
                        </div>
                    </article>      
                <%}%>
			</section>
		</div>
	</main>
	<my-footer></my-footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
	<script src="js/base.js"></script>
    <script src="js/shoppingCart.js"></script>
	<script>
		function showSizes(button) {
			button.nextElementSibling.classList.toggle('show');
		}
	</script>
</body>

</html>