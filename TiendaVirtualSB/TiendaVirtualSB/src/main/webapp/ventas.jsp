
<%@ page
	import="
        java.io.*,
        java.util.*,
        com.BO.TiendaVirtualSB.*,
        com.DTO.TiendaVirtualSB.*"%>
<html>
<%
ClienteController cc = new ClienteController();
long consec =0;
//CLIENTE
CClienteVO2 cli4 = new CClienteVO2();
int id4 = 0;
//cli4 =cc.listaDeClientes1(id4);

//PRODUCTO 1
productos cli = new productos();
Long id = (long) (0);
//cli = cc.listaDeProductos2(id);
double precio1 = 0;
double valorTotal1 = precio1 * Double.parseDouble(request.getParameter("cant1"));
int cantidad = Integer.parseInt(request.getParameter("cant1"));

//PRODUCTO 2
productos cli2 = new productos();
Long id2 = (long) (0);
//cli2 = cc.listaDeProductos2(id2);
double precio2 = 0;
double valorTotal2 = precio1 * Double.parseDouble(request.getParameter("cant2"));
int cantidad2 = Integer.parseInt(request.getParameter("cant2"));

//PRODUCTO 3
productos cli3 = new productos();
Long id3 = (long) (0);
//cli3 = cc.listaDeProductos2(id3);
double precio3 = 0;
double valorTotal3 = precio1 * Double.parseDouble(request.getParameter("cant3"));
int cantidad3 = Integer.parseInt(request.getParameter("cant3"));
//TOTALES
double valorTotalVenta = 0;
double valorTotalIva = 0;
double valorTotalIvaVenta = 0;

String opcion = request.getParameter("boton");
if (opcion.equals("Consultar_cliente")) {
	id4 = Integer.parseInt(request.getParameter("cedula"));
	//cli4 = cc.listaDeClientes1(id4);
	if (cc.consultarcliente(id4)) {
		cli4 = cc.listaDeClientes1(id4);
	} else {

		out.println(
		"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script language=JavaScript>");
		out.println("$(document).ready(function(){");
		out.println(
		"swal.fire({title: 'Cliente Inexistente', icon: 'error'}).then(function(){ window.location = 'Ventas.html';});");
		out.println("});");
		out.println("</script>");
	}

} else if (opcion.equals("Consultar1")) {
	id4 = Integer.parseInt(request.getParameter("cedula"));
	cli4 = cc.listaDeClientes1(id4);
	id = Long.parseLong(request.getParameter("cod. producto1"));

	if (cc.consultarProducto(id)) {
		cli = cc.listaDeProductos2(id);
		precio1 = cli.getPrecio_compra();
		valorTotal1 = precio1 * Double.parseDouble(request.getParameter("cant1"));
		cantidad = Integer.parseInt(request.getParameter("cant1"));
		//TOTALES
		valorTotalVenta = valorTotal1 + valorTotal2 + valorTotal3;
		valorTotalIva = valorTotalVenta * 0.19;
		valorTotalIvaVenta = valorTotalVenta + valorTotalIva;
	} else {

		out.println(
		"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script language=JavaScript>");
		out.println("$(document).ready(function(){");
		out.println(
		"swal.fire({title: 'Producto Inexistente', icon: 'error'}).then(function(){ window.location = 'Ventas.html';});");
		out.println("});");
		out.println("</script>");
	}

} else if (opcion.equals("Consultar2")) {
	id4 = Integer.parseInt(request.getParameter("cedula"));
	cli4 = cc.listaDeClientes1(id4);
	id = Long.parseLong(request.getParameter("cod. producto1"));
	cli = cc.listaDeProductos2(id);
	id2 = Long.parseLong(request.getParameter("cod. producto2"));
	if (cc.consultarProducto(id2)) {

		cli2 = cc.listaDeProductos2(id2);
		precio1 = cli.getPrecio_compra();
		precio2 = cli2.getPrecio_compra();
		valorTotal2 = precio1 * Double.parseDouble(request.getParameter("cant2"));
		cantidad2 = Integer.parseInt(request.getParameter("cant2"));
		valorTotal1 = precio1 * Double.parseDouble(request.getParameter("cant1"));
		cantidad = Integer.parseInt(request.getParameter("cant1"));
		//TOTALES
		valorTotalVenta = valorTotal1 + valorTotal2 + valorTotal3;
		valorTotalIva = valorTotalVenta * 0.19;
		valorTotalIvaVenta = valorTotalVenta + valorTotalIva;
	} else {

		out.println(
		"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script language=JavaScript>");
		out.println("$(document).ready(function(){");
		out.println(
		"swal.fire({title: 'Producto Inexistente', icon: 'error'}).then(function(){ window.location = 'Ventas.html';});");
		out.println("});");
		out.println("</script>");
	}

} else if (opcion.equals("Consultar3")) {
	id4 = Integer.parseInt(request.getParameter("cedula"));
	cli4 = cc.listaDeClientes1(id4);
	id = Long.parseLong(request.getParameter("cod. producto1"));
	cli = cc.listaDeProductos2(id);
	id2 = Long.parseLong(request.getParameter("cod. producto2"));
	cli2 = cc.listaDeProductos2(id2);
	id3 = Long.parseLong(request.getParameter("cod. producto3"));
	if (cc.consultarProducto(id3)) {

		cli3 = cc.listaDeProductos2(id3);
		precio3 = cli3.getPrecio_compra();
		precio2 = cli2.getPrecio_compra();
		precio1 = cli.getPrecio_compra();
		valorTotal3 = precio1 * Double.parseDouble(request.getParameter("cant3"));
		cantidad3 = Integer.parseInt(request.getParameter("cant3"));
		valorTotal2 = precio1 * Double.parseDouble(request.getParameter("cant2"));
		cantidad2 = Integer.parseInt(request.getParameter("cant2"));
		valorTotal1 = precio1 * Double.parseDouble(request.getParameter("cant1"));
		cantidad = Integer.parseInt(request.getParameter("cant1"));
		//TOTALES
		valorTotalVenta = valorTotal1 + valorTotal2 + valorTotal3;
		valorTotalIva = valorTotalVenta * 0.19;
		valorTotalIvaVenta = valorTotalVenta + valorTotalIva;
	} else {

		out.println(
		"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script language=JavaScript>");
		out.println("$(document).ready(function(){");
		out.println(
		"swal.fire({title: 'Producto Inexistente', icon: 'error'}).then(function(){ window.location = 'Ventas.html';});");
		out.println("});");
		out.println("</script>");
	}
} else if (opcion.equals("confirmar")) {
	id4 = Integer.parseInt(request.getParameter("cedula"));
	cli4 = cc.listaDeClientes1(id4);
	id = Long.parseLong(request.getParameter("cod. producto1"));
	

	if ( Integer.parseInt(request.getParameter("cant1"))>=0 && Integer.parseInt(request.getParameter("cant2"))== 0) {
		cc.consultarProducto(id);
		cli = cc.listaDeProductos2(id);
		precio1 = cli.getPrecio_compra();
		valorTotal1 = precio1 * Double.parseDouble(request.getParameter("cant1"));
		cantidad = Integer.parseInt(request.getParameter("cant1"));
		//TOTALES
		valorTotalVenta = valorTotal1 + valorTotal2 + valorTotal3;
		valorTotalIva = valorTotalVenta * 0.19;
		valorTotalIvaVenta = valorTotalVenta + valorTotalIva;
		ventasVO vent = new ventasVO();
		
		vent.setcedula_cliente(Integer.parseInt(request.getParameter("cedula")));
		vent.setvalor_venta(Double.parseDouble(request.getParameter("total venta")));
		vent.setivaventa(Double.parseDouble(request.getParameter("total iva")));
		vent.settotal_venta(Double.parseDouble(request.getParameter("total con iva")));		
		cc.registrarVenta(vent);
		//consec = cc.codigo_ventamax();
		long vid=2;
		detalleVentasVO detallevent = new detalleVentasVO();
		detallevent.setcantidad_producto(Integer.parseInt(request.getParameter("cant1")));
		detallevent.setcodigo_producto(id);
		detallevent.setcodigo_venta(vid);
		detallevent.setvalor_venta(Double.parseDouble(request.getParameter("total venta")));
		detallevent.setvaloriva(Double.parseDouble(request.getParameter("total iva")));
		detallevent.setvalor_total(Double.parseDouble(request.getParameter("total con iva")));	
		cc.registrarDETALLEVenta(detallevent);
	} else if (Integer.parseInt(request.getParameter("cant1"))>=0 && Integer.parseInt(request.getParameter("cant2"))>=0 && Integer.parseInt(request.getParameter("cant3"))== 0) {
		id2 = Long.parseLong(request.getParameter("cod. producto2"));
		cc.consultarProducto(id2);
		cli = cc.listaDeProductos2(id);
		cli2 = cc.listaDeProductos2(id2);
		precio1 = cli.getPrecio_compra();
		precio2 = cli2.getPrecio_compra();
		valorTotal2 = precio1 * Double.parseDouble(request.getParameter("cant2"));
		cantidad2 = Integer.parseInt(request.getParameter("cant2"));
		valorTotal1 = precio1 * Double.parseDouble(request.getParameter("cant1"));
		cantidad = Integer.parseInt(request.getParameter("cant1"));
		//TOTALES
		valorTotalVenta = valorTotal1 + valorTotal2 + valorTotal3;
		valorTotalIva = valorTotalVenta * 0.19;
		valorTotalIvaVenta = valorTotalVenta + valorTotalIva;
		ventasVO vent = new ventasVO();
		vent.setcedula_cliente(Integer.parseInt(request.getParameter("cedula")));
		vent.setvalor_venta(Double.parseDouble(request.getParameter("total venta")));
		vent.setivaventa(Double.parseDouble(request.getParameter("total iva")));
		vent.settotal_venta(Double.parseDouble(request.getParameter("total con iva")));
		cc.registrarVenta(vent);
		//consec = vent.getcodigo_venta();
		long vid=2;
		detalleVentasVO detallevent = new detalleVentasVO();
		detallevent.setcantidad_producto(Integer.parseInt(request.getParameter("cant1")));
		detallevent.setcodigo_producto(id);
		detallevent.setcodigo_venta(vid);
		detallevent.setvalor_venta(Double.parseDouble(request.getParameter("total venta")));
		detallevent.setvaloriva(Double.parseDouble(request.getParameter("total iva")));
		detallevent.setvalor_total(Double.parseDouble(request.getParameter("total con iva")));	
		cc.registrarDETALLEVenta(detallevent);
		detalleVentasVO detallevent2 = new detalleVentasVO();
		detallevent2.setcantidad_producto(Integer.parseInt(request.getParameter("cant2")));
		detallevent2.setcodigo_producto(id2);
		detallevent2.setcodigo_venta(vid);
		detallevent2.setvalor_venta(Double.parseDouble(request.getParameter("total venta")));
		detallevent2.setvaloriva(Double.parseDouble(request.getParameter("total iva")));
		detallevent2.setvalor_total(Double.parseDouble(request.getParameter("total con iva")));	
		cc.registrarDETALLEVenta(detallevent2);
	} else if (Integer.parseInt(request.getParameter("cant1"))>=0 && Integer.parseInt(request.getParameter("cant2"))>=0 && Integer.parseInt(request.getParameter("cant3"))>=0)  {
		id2 = Long.parseLong(request.getParameter("cod. producto2"));
		id3 = Long.parseLong(request.getParameter("cod. producto3"));
		cc.consultarProducto(id3);
		cli = cc.listaDeProductos2(id);
		cli2 = cc.listaDeProductos2(id2);
		cli3 = cc.listaDeProductos2(id3);
		precio3 = cli3.getPrecio_compra();
		precio2 = cli2.getPrecio_compra();
		precio1 = cli.getPrecio_compra();
		valorTotal3 = precio1 * Double.parseDouble(request.getParameter("cant3"));
		cantidad3 = Integer.parseInt(request.getParameter("cant3"));
		valorTotal2 = precio1 * Double.parseDouble(request.getParameter("cant2"));
		cantidad2 = Integer.parseInt(request.getParameter("cant2"));
		valorTotal1 = precio1 * Double.parseDouble(request.getParameter("cant1"));
		cantidad = Integer.parseInt(request.getParameter("cant1"));
		//TOTALES
		valorTotalVenta = valorTotal1 + valorTotal2 + valorTotal3;
		valorTotalIva = valorTotalVenta * 0.19;
		valorTotalIvaVenta = valorTotalVenta + valorTotalIva;
		ventasVO vent = new ventasVO();
		vent.setcedula_cliente(Integer.parseInt(request.getParameter("cedula")));
		vent.setvalor_venta(Double.parseDouble(request.getParameter("total venta")));
		vent.setivaventa(Double.parseDouble(request.getParameter("total iva")));
		vent.settotal_venta(Double.parseDouble(request.getParameter("total con iva")));
		cc.registrarVenta(vent);
		//consec = vent.getcedula_cliente();
		long vid=2;
		detalleVentasVO detallevent = new detalleVentasVO();
		detallevent.setcantidad_producto(Integer.parseInt(request.getParameter("cant1")));
		detallevent.setcodigo_producto(id);
		detallevent.setcodigo_venta(vid);
		detallevent.setvalor_venta(Double.parseDouble(request.getParameter("total venta")));
		detallevent.setvaloriva(Double.parseDouble(request.getParameter("total iva")));
		detallevent.setvalor_total(Double.parseDouble(request.getParameter("total con iva")));	
		cc.registrarDETALLEVenta(detallevent);
		detalleVentasVO detallevent2 = new detalleVentasVO();
		detallevent2.setcantidad_producto(Integer.parseInt(request.getParameter("cant2")));
		detallevent2.setcodigo_producto(id2);
		detallevent2.setcodigo_venta(vid);
		detallevent2.setvalor_venta(Double.parseDouble(request.getParameter("total venta")));
		detallevent2.setvaloriva(Double.parseDouble(request.getParameter("total iva")));
		detallevent2.setvalor_total(Double.parseDouble(request.getParameter("total con iva")));	
		cc.registrarDETALLEVenta(detallevent2);
		detalleVentasVO detallevent3 = new detalleVentasVO();
		detallevent3.setcantidad_producto(Integer.parseInt(request.getParameter("cant3")));
		detallevent3.setcodigo_producto(id3);
		detallevent3.setcodigo_venta(vid);
		detallevent3.setvalor_venta(Double.parseDouble(request.getParameter("total venta")));
		detallevent3.setvaloriva(Double.parseDouble(request.getParameter("total iva")));
		detallevent3.setvalor_total(Double.parseDouble(request.getParameter("total con iva")));	
		cc.registrarDETALLEVenta(detallevent3);
	} else if (Integer.parseInt(request.getParameter("cant1"))<0 || Integer.parseInt(request.getParameter("cant2"))<0 || Integer.parseInt(request.getParameter("cant3"))<0) {

		out.println(
		"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script language=JavaScript>");
		out.println("$(document).ready(function(){");
		out.println(
		"swal.fire({title: 'Cantidad negativa', icon: 'error'}).then(function(){ window.location = 'Ventas.html';});");
		out.println("});");
		out.println("</script>");
	}
	
}

/*String opcion = request.getParameter("boton");

if (opcion.equals("Consultar_cliente")) {

	ClienteController cc2 = new ClienteController();
	CClienteVO2 cli4 = new CClienteVO2();
	int id4 = Integer.parseInt(request.getParameter("cedula"));
	//cli.setdireccion_cliente(request.getParameter("direccion_cliente"));
	cli4.setcedula_cliente(id4);
	//cli.setemail_cliente(request.getParameter("email_cliente"));
	//cli.setnombre_cliente(request.getParameter("nombre_cliente"));
	//cli.settelefono_cliente(request.getParameter("telefono_cliente"));
	//cc.modificarcliente(cli);
	if (cc2.consultarcliente(id4)) {
		cli4 = cc2.listaDeClientes1(id4);
		out.println(
		"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script language=JavaScript>");
		out.println("$(document).ready(function(){");
		out.println("swal.fire({title: 'Cliente Encontrado', icon: 'success'});");
		out.println("});");
		out.println("</script>");

} else {
		
		out.println(
		"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script language=JavaScript>");
		out.println("$(document).ready(function(){");
		out.println(
		"swal.fire({title: 'Cliente Inexistente', icon: 'error'}).then(function(){ window.location = 'Ventas.html';});");
		out.println("});");
		out.println("</script>");
}
} else  {


	out.println(
	"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
	out.println("<script language=JavaScript>");
	out.println("$(document).ready(function(){");
	out.println("swal.fire({title: 'Cliente existente', icon: 'error'}).then(function(){ window.location = 'Ventas.html';});");
	out.println("});");
	out.println("</script>");


}*/
%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="navegacion.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Ventas</title>
</head>

<body>
	<header class="header">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-md navbar-dark bg-dark">
				<a href="#" class="navbar-brand"> tienda genérica </a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#menu">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="menu">
					<ul class="navbar-nav m-sm-auto text-center">
						<li class="navbar-item active display-5"><a class="nav-link"
							href="usuarios.html">usuarios</a></li>
						<li class="navbar-item active display-5"><a class="nav-link"
							href="clientes.html">clientes</a></li>
						<li class="navbar-item active display-5"><a class="nav-link"
							href="proveedores.html">proveedores</a></li>
						<li class="navbar-item active display-5"><a class="nav-link"
							href="productos.html">productos</a></li>
						<li class="navbar-item active display-5"><a class="nav-link"
							href="ventas.html">ventas</a></li>
						<li class="navbar-item active display-5"><a class="nav-link"
							href="reportes.html">reportes</a></li>
					</ul>
				</div>
				<div class="dropdown">
					<a style="color: white;" href="#" class="nav-link dropdown-toggle"
						data-toggle="dropdown">cerrar sesi�n</a>
					<div class="dropdown-menu text-center">
						<a><img src="img/user2.png" height="80" width="80"></a><br>

						<a>user</a> <a>correo@mail.com</a>
						<div class="dropdown-divider"></div>
						<a href="login/index.html" class="dropdown-item">salir</a>


					</div>
				</div>
			</nav>
		</div>
	</header>
	<div class="container-fluid" style="padding: 10%;">
		<div class="content">
			<form action="ventas.jsp" method="post">
				<h1>
					<strong>bienvenido al registro de ventas</strong>
				</h1>
				<br>
				<table border="0">
					<tr>
						<td>c�dula</td>
						<td><input type="text" name="cedula"
							value="<%=cli4.getcedula_cliente()%>"></td>
						<td><input type="submit" value="Consultar_cliente"
							name="boton"></td>
						<td>cliente</td>
						<td><input type="text" name="cliente"
							value="<%=cli4.getnombre_cliente()%>"></td>
						<td>consec.</td>
						<td><input type="text" name="consec" value="<%=consec%>"></td>
					</tr>

					<tr>
						<td></td>
						<td>cod. producto</td>
						<td></td>
						<td>nombre producto</td>
						<td>cant.</td>
						<td>vlr. total</td>


					</tr>
					<tr>
						<td></td>
						<td><input type="text" name="cod. producto1"
							value="<%=cli.getCodigo_producto()%>"></td>
						<td><input type="submit" value="Consultar1" name="boton"></td>
						<td><input type="text" name="nombre producto"
							value="<%=cli.getNombre_producto()%>"></td>
						<td><input type="text" name="cant1" value="<%=cantidad%>"></td>
						<td><input type="text" name="vlr. total"
							value="<%=valorTotal1%>"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" name="cod. producto2"
							value="<%=cli2.getCodigo_producto()%>"></td>
						<td><input type="submit" value="Consultar2" name="boton"></td>
						<td><input type="text" name="nombre producto"
							value="<%=cli2.getNombre_producto()%>"></td>
						<td><input type="text" name="cant2" value="<%=cantidad2%>"></td>
						<td><input type="text" name="vlr. total"
							value="<%=valorTotal2%>"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" name="cod. producto3"
							value="<%=cli3.getCodigo_producto()%>"></td>
						<td><input type="submit" value="Consultar3" name="boton"></td>
						<td><input type="text" name="nombre producto"
							value="<%=cli3.getNombre_producto()%>"></td>
						<td><input type="text" name="cant3" value="<%=cantidad3%>"></td>
						<td><input type="text" name="vlr. total"
							value="<%=valorTotal3%>"></td>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>total venta</td>
						<td><input type="text" name="total venta"
							value="<%=valorTotalVenta%>"></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>total iva</td>
						<td><input type="text" name="total iva"
							value="<%=valorTotalIva%>"></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="submit" value="confirmar" name="boton"></td>
						<td>total con iva</td>
						<td><input type="text" name="total con iva"
							value="<%=valorTotalIvaVenta%>"></td>
					</tr>
				</table>
			</form>
</body>

</html>