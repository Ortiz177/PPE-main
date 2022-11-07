let contenedor_menu;
let menu_items = [];
let paginas = [];
var productos = [];
var iniciarLogin = undefined, iniciarRegistro = undefined;
let logeado = false;
const menu_html = `<ul class="nav navbar-nav">
<div class="agileits-logo">
<h1><a href="index.html">Gaming <span>Store</span></a></h1>
</div>
<li>
<a href="javascript:void(0);" id="item_1">INICIO</a>
</li>
<li>
<a href="javascript:void(0);" id="item_2">JUEGOS</a>
</li>
<li>
<a href="#contacto" class="scroll">CONTACTO</a>
</li>`;
let sesion_on = menu_html + `
<li>
<a href="javascript:void(0)" id="cerrar_sesion" onClick="cambiarSesion(false);" class="btn"><i class="fa fa-sign-out" aria-hidden="true"></i> Cerrar sesión</a>
</li>`;
let sesion_off = menu_html + `
<li>
<a href="javascript:void(0)" id="item_3">INGRESAR</a>
</li>
<li>
<a href="javascript:void(0)" id="item_4">REGISTRAR</a>
</li>`;

window.onload = function () {
    contenedor_menu = document.querySelector(".menu");
    contenedor_menu.innerHTML = menu_html;
    setTimeout(hideURLbar, 0);

    cambiarSesion(JSON.parse(localStorage.getItem("logeado")));

    if (iniciarLogin) {
        iniciarLogin();
    }

    if (iniciarRegistro) {
        iniciarRegistro();
    }

    if (window.hasOwnProperty("pintarGaleria")) {
        llenarProductos();
        pintarGaleria();
    }

    if (window.hasOwnProperty("leerProductoActual")) {
        leerProductoActual();
    }

    asignarNavegacion();
    activarPaginaActual();
}

function cambiarSesion(bandera) {

    logeado = bandera;
    localStorage.setItem("logeado", logeado);

    if (logeado) {
        contenedor_menu.innerHTML = sesion_on;
    }
    else {
        contenedor_menu.innerHTML = sesion_off;

        if (cerrarSesion()) {
            location.href = "index.html";
        }
    }
}

function cerrarSesion() {
    let pagina_actual = location.pathname.split("/").pop();
    return (pagina_actual === paginas["item_2"] || pagina_actual === paginas["item_5"]);
}

function asignarNavegacion() {
    menu_items.push(document.getElementById("item_1"));
    menu_items.push(document.getElementById("item_2"));
    menu_items.push(document.getElementById("item_3"));
    menu_items.push(document.getElementById("item_4"));
    menu_items.push(document.getElementById("item_5"));

    paginas["item_1"] = "index.html";
    paginas["item_2"] = "juegos.html";
    paginas["item_3"] = "login.html";
    paginas["item_4"] = "register.html";
    paginas["item_5"] = "juegos.html";

    for (var i of menu_items) {
        i.addEventListener("click", abrirPagina);
    }
}

function hideURLbar() {
    window.scrollTo(0, 1);
}

function actualizarSeleccion(btn) {
    for (var i of menu_items) {
        i.classList.remove("active");
    }
    btn.parentElement.classList.add("active");
}

function activarPaginaActual() {
    let pagina = localStorage.getItem("pagina_actual");
    let btn;
    console.log(pagina);
    if (pagina) {
        btn = document.getElementById(pagina);
        actualizarSeleccion(btn);
    }
}

function guardarPaginaActual(pagina) {
    let seleccion = pagina;
    console.log(pagina);
    localStorage.setItem("pagina_actual", seleccion);
}

function abrirPagina(evento) {

    let pagina = evento.target.id;
    let puede_ingresar = true;

    if (pagina === "item_2" || pagina === "item_5") {
        puede_ingresar = logeado;
    }

    if (puede_ingresar) {
        guardarPaginaActual(pagina);
        location.href = paginas[pagina];
    }
    else {
        alert("Esta seccion requiere inicio de sesion.");
        location.href = "login.html";
    }
}

const roundToPrecision = (value, decimals) => {
    const pow = Math.pow(10, decimals);
    return Math.round((value + Number.EPSILON) * pow) / pow;
};