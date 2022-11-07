function llenarProductos() {
	for (let j = 1; j < 13; j++) {
		fetch(`https://www.freetogame.com/api/game?id=${j}`).then((response) => response.json()).then((data) => {
			productos[j] = {
				id: data.id,
				title: data.title,
				thumbnail: data.thumbnail
			};
		});
	}
}

function armarProducto(info_producto) {
	let precio = info_producto.precio;
	let precio_con_descuento = precio - (precio * info_producto.descuento);
	precio_con_descuento = roundToPrecision(precio_con_descuento, 2);
	let producto = `
	<div class="col-lg-3 shop-info-grid text-center mt-4">
			<div class="product-shoe-info shoe">
				<div class="men-thumb-item">
					<img src="${info_producto.thumbnail}" class="img-fluid" alt="">

				</div>
				<div class="item-info-product">
					<h4>
						<a href="javascript:void(0);" onclick="verDetalle(${info_producto.id});">${info_producto.title}</a>
					</h4>

					<ul class="stars">
						<li><a href="#"><span class="fa fa-star" aria-hidden="true"></span></a></li>
						<li><a href="#"><span class="fa fa-star" aria-hidden="true"></span></a></li>
						<li><a href="#"><span class="fa fa-star-half-o" aria-hidden="true"></span></a></li>
						<li><a href="#"><span class="fa fa-star-half-o" aria-hidden="true"></span></a></li>
						<li><a href="#"><span class="fa fa-star-o" aria-hidden="true"></span></a></li>
					</ul>
				</div>
			</div>
		</div>`;

	return producto;
}

function verDetalle(id) {
	let seleccion = JSON.stringify(productos[id]);
	let producto_actual = localStorage.setItem("producto", seleccion);
	location.href = "single.html";
}

function pintarGaleria() {
	let html = '';
	let contador = 1;
	let contenedor = document.querySelector(".galeria");

	for (var i in productos) {

		html += (contador == 1) ? '<div class="row shop-wthree-info text-center">' : '';
		html += armarProducto(productos[i]);
		if (contador == 4) {
			html += '</div>';
			contador = 1;
		}
		else {
			contador++;
		}
	}
	html += "<br><br>";
	contenedor.innerHTML = html;
}