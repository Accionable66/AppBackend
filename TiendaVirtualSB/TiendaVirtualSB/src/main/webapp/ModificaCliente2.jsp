
<%@ page
	import="
        java.io.*,
        java.util.*,
        com.BO.TiendaVirtualSB.*,
        com.DTO.TiendaVirtualSB.*"%>
<html>
<%
String opcion = request.getParameter("boton");

if (opcion.equals("Consultar")) {

	ClienteController cc = new ClienteController();
	CClienteVO2 cli = new CClienteVO2();
	int id = Integer.parseInt(request.getParameter("cedula_cliente"));
	//cli.setdireccion_cliente(request.getParameter("direccion_cliente"));
	cli.setcedula_cliente(id);
	//cli.setemail_cliente(request.getParameter("email_cliente"));
	//cli.setnombre_cliente(request.getParameter("nombre_cliente"));
	//cli.settelefono_cliente(request.getParameter("telefono_cliente"));
	//cc.modificarcliente(cli);
	if (cc.consultarcliente(id)) {
		cli = cc.listaDeClientes1(id);
		out.println(
		"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script language=JavaScript>");
		out.println("$(document).ready(function(){");
		out.println("swal.fire({title: 'Cliente Encontrado', icon: 'success'});");
		out.println("});");
		out.println("</script>");
%>
<%-- <form action="clientes.html" method="POST">
	CEDULA: <input type="text" name="cedula_cliente"
		value="<%= cli.getcedula_cliente()%>" /> <br /> DIRECCION: <input
		type="text" name="direccion_cliente"
		value="<%= cli.getdireccion_cliente()%>"> <br /> EMAIL: <input
		type="text" name="email_cliente" value="<%= cli.getemail_cliente()%>" />
	<br /> NOMBRE: <input type="text" name="nombre_cliente"
		value="<%= cli.getnombre_cliente()%>" /> <br /> TELEFONO: <input
		type="text" name="telefono_cliente"
		value="<%= cli.gettelefono_cliente()%>" /> <br />
</form>
--%>
 <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="navegacion.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Usuarios</title>
    </head>

   <body>
    <header class="header">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                <a href="#" class="navbar-brand">
                    Tienda genérica                 
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="menu">
                    <ul class="navbar-nav m-sm-auto text-center">
                        <li class="navbar-item active display-5">
                            <a class="nav-link" href="UsuarioActualiza.html">Usuarios</a>
                        </li>
                        <li class="navbar-item active display-5">
                            <a class="nav-link" href="clientes.html">Clientes</a>
                        </li>
                        <li class="navbar-item active display-5">
                            <a class="nav-link" href="proveedores.html">Proveedores</a>
                        </li>
                        <li class="navbar-item active display-5">
                            <a class="nav-link" href="ProductosActualiza.html">Productos</a>
                        </li>
                        <li class="navbar-item active display-5">
                            <a class="nav-link" href="ventas.html">Ventas</a>
                        </li>
                        <li class="navbar-item active display-5">
                            <a class="nav-link" href="reportes.html">Reportes</a>
                        </li>
                    </ul>
                </div>
                <div class="dropdown">
                    <a style="color:white;" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar sesión</a>
                <div class="dropdown-menu text-center">
                    <a><img src="img/user2.png" height="80" width="80"></a><br>
                    <a>User</a>
                    <a>Correo@mail.com</a>
                    <div class="dropdown-divider"></div>
                    <a href="Login/index.html" class="dropdown-item">Salir</a>

                </div>
            </div>   
            </nav>
        </div>
    </header>     
        <div class="container-fluid" style="padding: 10%;">
            <div class="content">
                <form action = "ModificaCliente2.jsp" method = "GET">
                    <h1><strong>Bienvenido al área de usuarios</strong></h1>
                    <div class="user-details">
                        <div class = "input-box">
                            <span class = "details">C&eacute;dula</span>
                            <input type="text" name="cedula_cliente" placeholder="Ingrese c&eacute;dula" value="<%= cli.getcedula_cliente()%>" />
                        </div>
                        <div class = "input-box">
                            <span class = "details">Telefono</span>
                            <input type="text" name="telefono_cliente" placeholder="Ingrese telefono" value="<%= cli.gettelefono_cliente()%>"/>
                        </div>  
                        <div class = "input-box">
                            <span class = "details">Correo electr&oacute;nico</span>
                            <input type="text" name="email_cliente" placeholder="Ingrese correo" value="<%= cli.getemail_cliente()%>"/>
                        </div>
                        <div class = "input-box">
                            <span class = "details">Direccion</span>
                            <input type="text" name="direccion_cliente" placeholder="Ingrese direccion" value="<%= cli.getdireccion_cliente()%>" />
                        </div>
                        <div class = "input-box">
                            <span class = "details">Nombre completo</span>
                            <input type="text" name="nombre_cliente" placeholder="Ingrese nombre" value="<%= cli.getnombre_cliente()%>" /> 
                        </div>
                    </div>
                    <br>
                    <div class = "button" style="margin-left: 300px; ;">
                        <input style="margin-right: 30px; margin-left: 40px;" type="submit" name="boton" value="Consultar" />
                        <input style="margin-right: 30px; margin-left: 40px;" type="submit" name="boton" value="Crear" />
                        <input style="margin-right: 30px; margin-left: 40px;" type="submit" name="boton" value="Actualizar" />
                        <input style="margin-right: 30px; margin-left: 40px;" type="submit" name="boton" value="Borrar" />
                    </div>
                    
                </form>
            </div>
        </div>
        
    </body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>
<%
} else {
		cc.registrarcliente(cli);
		out.println(
		"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script language=JavaScript>");
		out.println("$(document).ready(function(){");
		out.println(
		"swal.fire({title: 'Cliente Inexistente', icon: 'error'}).then(function(){ window.location = 'clientes.html';});");
		out.println("});");
		out.println("</script>");
}
} else if (opcion.equals("Crear")) {
ClienteController cc = new ClienteController();
CClienteVO2 cli = new CClienteVO2();
int id = Integer.parseInt(request.getParameter("cedula_cliente"));
cli.setdireccion_cliente(request.getParameter("direccion_cliente"));
cli.setcedula_cliente(id);
cli.setemail_cliente(request.getParameter("email_cliente"));
cli.setnombre_cliente(request.getParameter("nombre_cliente"));
cli.settelefono_cliente(request.getParameter("telefono_cliente"));
if (cc.consultarcliente(id)) {
	out.println(
	"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
	out.println("<script language=JavaScript>");
	out.println("$(document).ready(function(){");
	out.println("swal.fire({title: 'Cliente existente', icon: 'error'}).then(function(){ window.location = 'clientes.html';});");
	out.println("});");
	out.println("</script>");
} else {
	cc.registrarcliente(cli);
	out.println(
	"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
	out.println("<script language=JavaScript>");
	out.println("$(document).ready(function(){");
	out.println("swal.fire({title: 'Cliente creado', icon: 'success'}).then(function(){ window.location = 'clientes.html';});");
	out.println("});");
	out.println("</script>");
}

} else if (opcion.equals("Actualizar")) {

ClienteController cc = new ClienteController();
CClienteVO2 cli = new CClienteVO2();
int id = Integer.parseInt(request.getParameter("cedula_cliente"));
cli.setdireccion_cliente(request.getParameter("direccion_cliente"));
cli.setcedula_cliente(id);
cli.setemail_cliente(request.getParameter("email_cliente"));
cli.setnombre_cliente(request.getParameter("nombre_cliente"));
cli.settelefono_cliente(request.getParameter("telefono_cliente"));
if (cc.consultarcliente(id)) {
	cc.modificarcliente(cli);
	out.println(
	"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
	out.println("<script language=JavaScript>");
	out.println("$(document).ready(function(){");
	out.println("swal.fire({title: 'Datos del cliente actualizados', icon: 'success'}).then(function(){ window.location = 'clientes.html';});");
	out.println("});");
	out.println("</script>");
} else {
	out.println(
	"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
	out.println("<script language=JavaScript>");
	out.println("$(document).ready(function(){");
	out.println("swal.fire({title: 'Cliente no existe', icon: 'error'}).then(function(){ window.location = 'clientes.html';});");
	out.println("});");
	out.println("</script>");

}

} else {
ClienteController cc = new ClienteController();
CClienteVO2 cli = new CClienteVO2();
int id = Integer.parseInt(request.getParameter("cedula_cliente"));
cli.setdireccion_cliente(request.getParameter("direccion_cliente"));
cli.setcedula_cliente(id);
cli.setemail_cliente(request.getParameter("email_cliente"));
cli.setnombre_cliente(request.getParameter("nombre_cliente"));
cli.settelefono_cliente(request.getParameter("telefono_cliente"));
if (cc.consultarcliente(id)) {
	cc.eliminarcliente(cli);
	out.println(
	"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
	out.println("<script language=JavaScript>");
	out.println("$(document).ready(function(){");
	out.println("swal.fire({title: 'Datos del cliente borrados', icon: 'success'}).then(function(){ window.location = 'clientes.html';});");
	out.println("});");
	out.println("</script>");
} else {
	out.println(
	"<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
	out.println("<script language=JavaScript>");
	out.println("$(document).ready(function(){");
	out.println("swal.fire({title: 'Cédula incorrecta', icon: 'error'}).then(function(){ window.location = 'clientes.html';});");
	out.println("});");
	out.println("</script>");
}
}
%>