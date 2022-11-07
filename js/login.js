let btn_enviar, btn_cerrar_modal, formulario, ventana;
let correo, clave, usuario, imagen, titulo, mensaje;

function iniciarLogin() {
	btn_enviar = document.getElementById("btn_enviar");
	correo = document.getElementById("correo");
	clave = document.getElementById("clave");
	formulario = document.getElementById("formulario");
	formulario.addEventListener("submit", procesarLogin);
}


function procesarLogin(evento) {

	let txt_correo, txt_clave;
	let str_usuario, md5_clave;
	let error = false;
	txt_correo = correo.value;
	txt_clave = md5(clave.value);

	str_usuario = localStorage.getItem("usuario");
	usuario = JSON.parse(str_usuario);

	if (usuario) {
		if (usuario.correo === txt_correo && usuario.clave === txt_clave) {
			cambiarSesion(true);
			location.href = "index.html";
			alert("logueo exitoso");
		}
		else {
			error = true;
		}
	} else {
		error = true;
	}

	if (error) {
		alert("Revisa los datos, ocurrio un error.");
	}

	evento.preventDefault();
}