<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>blint</title>
	<link rel="icon" href="img/blint_icon.png" type="image/png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/product.css">
</head>

<body>
	<my-header class="sticky-top"></my-header>
	<main>
		<div class="hero">
			<div class="hero-btn-holder">
				<a href="product_hoodies.html" class="btn btn-light hero-btn">Sudaderas</a>
				<a href="product_t-shirts.html" class="btn btn-light hero-btn">Camisetas</a>
				<a href="product_pants.html" class="btn btn-light hero-btn">Pantalones</a>
			</div>
			<picture>
				<source media="(max-width: 768px)" srcset="img/home_sm.png">
				<source media="(max-width: 1024px)" srcset="img/home_md.png">
				<img src="img/home_default.png" class="img-fluid img-primary" alt="Winter collection image">
			</picture>
		</div>
		<div class="container">
			<section class="row prd">
				<header class="product-header">
					<h2>NUEVOS PRODUCTOS</h2>
					<a href="#" class="btn btn-link">Ver todos</a>
				</header>
				<article class="col-sm-12 col-md-6 col-lg-3">
					<div class="card">
						<div id="prd-1" class="carousel slide img-prd">

							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="img/products_hoodie/product_1/image_0.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
								<div class="carousel-item">
									<img src="img/products_hoodie/product_1/image_1.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
								<div class="carousel-item">
									<img src="img/products_hoodie/product_1/image_2.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
							</div>

							<button class="carousel-control-prev" type="button" data-bs-target="#prd-1"
								data-bs-slide="prev">
								<box-icon name='chevron-left' color="black" size="70px"></box-icon>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#prd-1"
								data-bs-slide="next">
								<box-icon name='chevron-right' color="black" size="70px"></box-icon>
								<span class="visually-hidden">Next</span>
							</button>
							<button class="icon-button" aria-label="Open sizes" onclick="showSizes(this)">
								<box-icon name="plus-circle" size="md" color="#55555569" type="solid"></box-icon>
							</button>
							<div class="sizes">
								<button type="button" onclick="alert('Producto añadido!')">S</button>
								<button type="button" onclick="alert('Producto añadido!')">M</button>
								<button type="button" onclick="alert('Producto añadido!')">L</button>
								<button type="button" onclick="alert('Producto añadido!')">XL</button>
							</div>
						</div>

						<div class="card-body">
							<h3 class="card-title">Nike Sportswear</h3>
							<p class="card-text">HOODIE - Sudadera</p>
							<span>69,95 €</span>
						</div>

					</div>
				</article>

				<article class="col-sm-12 col-md-6 col-lg-3">
					<div class="card">

						<div id="prd-2" class="carousel slide img-prd">

							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="img/products_t-shirts/product_1/image_0.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
								<div class="carousel-item">
									<img src="img/products_t-shirts/product_1/image_1.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
								<div class="carousel-item">
									<img src="img/products_t-shirts/product_1/image_2.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
							</div>

							<button class="carousel-control-prev" type="button" data-bs-target="#prd-2"
								data-bs-slide="prev">
								<box-icon name='chevron-left' color="black" size="70px"></box-icon>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#prd-2"
								data-bs-slide="next">
								<box-icon name='chevron-right' color="black" size="70px"></box-icon>
								<span class="visually-hidden">Next</span>
							</button>
							<button class="icon-button" aria-label="Open sizes" onclick="showSizes(this)">
								<box-icon name="plus-circle" size="md" color="#55555569" type="solid"></box-icon>
							</button>
							<div class="sizes">
								<button type="button" onclick="alert('Producto añadido!')">S</button>
								<button type="button" onclick="alert('Producto añadido!')">M</button>
								<button type="button" onclick="alert('Producto añadido!')">L</button>
								<button type="button" onclick="alert('Producto añadido!')">XL</button>
							</div>
						</div>

						<div class="card-body">
							<h3 class="card-title">Champion</h3>
							<p class="card-text">ATHLETICS GYM WITH PRINT </p>
							<span>29,95 €</span>
						</div>

					</div>
				</article>

				<article class="col-sm-12 col-md-6 col-lg-3">
					<div class="card">
						<div id="prd-3" class="carousel slide img-prd">

							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="img/products_hoodie/product_2/image_0.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
								<div class="carousel-item">
									<img src="img/products_hoodie/product_2/image_1.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
								<div class="carousel-item">
									<img src="img/products_hoodie/product_2/image_2.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
							</div>

							<button class="carousel-control-prev" type="button" data-bs-target="#prd-3"
								data-bs-slide="prev">
								<box-icon name='chevron-left' color="black" size="70px"></box-icon>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#prd-3"
								data-bs-slide="next">
								<box-icon name='chevron-right' color="black" size="70px"></box-icon>
								<span class="visually-hidden">Next</span>
							</button>
							<button class="icon-button" aria-label="Open sizes" onclick="showSizes(this)">
								<box-icon name="plus-circle" size="md" color="#55555569" type="solid"></box-icon>
							</button>
							<div class="sizes">
								<button type="button" onclick="alert('Producto añadido!')">S</button>
								<button type="button" onclick="alert('Producto añadido!')">M</button>
								<button type="button" onclick="alert('Producto añadido!')">L</button>
								<button type="button" onclick="alert('Producto añadido!')">XL</button>
							</div>
						</div>

						<div class="card-body">
							<h3 class="card-title">YOURTURN</h3>
							<p class="card-text">WASHED ZIP-HOODIE UNISEX</p>
							<span>44,99 €</span>
						</div>

					</div>
				</article>

				<article class="col-sm-12 col-md-6 col-lg-3">
					<div class="card">
						<div id="prd-4" class="carousel slide img-prd">

							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="img/products_pants/product_1/image_0.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
								<div class="carousel-item">
									<img src="img/products_pants/product_1/image_1.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
								<div class="carousel-item">
									<img src="img/products_pants/product_1/image_2.webp" class="d-block w-100"
										alt="Imagen de producto">
								</div>
							</div>

							<button class="carousel-control-prev" type="button" data-bs-target="#prd-4"
								data-bs-slide="prev">
								<box-icon name='chevron-left' color="black" size="70px"></box-icon>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#prd-4"
								data-bs-slide="next">
								<box-icon name='chevron-right' color="black" size="70px"></box-icon>
								<span class="visually-hidden">Next</span>
							</button>
							<button class="icon-button" aria-label="Open sizes" onclick="showSizes(this)">
								<box-icon name="plus-circle" size="md" color="#55555569" type="solid"></box-icon>
							</button>
							<div class="sizes">
								<button type="button" onclick="addProductToCart(1,'ADIDAS ORIGINALS',74.95,'Adidas','Sudadera', 'img/1'  )">S</button>
								<button type="button" onclick="alert('Producto añadido!')">M</button>
								<button type="button" onclick="alert('Producto añadido!')">L</button>
								<button type="button" onclick="alert('Producto añadido!')">XL</button>
							</div>
						</div>

						<div class="card-body">
							<h3 class="card-title"><bold>ADIDAS ORIGINALS</bold></h3>
							<p class="card-text">ADIBREAK UNISEX</p>
							<span>74,95 €</span>
						</div>

					</div>
				</article>
			</section>
		</div>
	</main>
	<my-footer></my-footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
	<script src="js/base.js"></script>
	<script src="js/bag.js"></script>
	<script>
		function showSizes(button) {
			button.nextElementSibling.classList.toggle('show');
		}
	</script>
</body>

</html>