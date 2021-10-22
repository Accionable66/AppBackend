<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaVirtualSB.*,
        com.DTO.TiendaVirtualSB.*"
%>
<html>
<head>
<style>
 <%@ include file = "style.css" %>

</style>
</head>

 <% String opcion=request.getParameter("boton"); 
     
  if (opcion.equals("Consultar")){ 
    	ClienteController cc=new ClienteController();
 	    ProveedorVO pro=new ProveedorVO();
 	    //String opcion1=request.getParameter("cedula"); 
 	    //String opcion2=" ";
 	    //if (opcion1){ 
	    	// String site="http://www.google.com" ; 
	        // response.setStatus(response.SC_MOVED_TEMPORARILY);
	        // response.setHeader("Location", site); 
	        // } 
 	    int id=Integer.parseInt(request.getParameter("nit"));
 		//pro.setnombreUsuario(request.getParameter("usuario"));
 		pro.setnitProveedor(id);    
 		//pro.setemailUsuario(request.getParameter("correo"));
 		//pro.setpassword(request.getParameter("contrasena"));
 		//pro.setusuario(request.getParameter("nombre")); 
 		if(cc.consultarProveedor (id)){ 
 			 pro=cc.listaDeProveedores1(id);
 			 out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
 	    	 out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
             out.println("<script language=JavaScript>");
             out.println("$(document).ready(function(){");
             out.println("swal.fire({title: 'Proveedor Encontrado', icon: 'success'});");
             out.println("});");
             out.println("</script>");%>
         <%--     <form action="proveedores.html" method="POST">
             ID: <input type="text" name="nit" value="<%= pro.getnitProveedor()%>" />
             <br />
             Telefono: <input type="text" name="telefono" value="<%= pro.gettelefonoProveedor()%>" />
             <br />
             Nom_pro: <input type="text" name="nombre" value="<%= pro.getnombreProveedor()%>" />
             <br />
             Ciudad: <input type="text" name="ciudad" value="<%= pro.getciudadProveedor()%>" />
             <br />
			Direccion: <input type="text" name="direccion" value="<%= pro.getdireccionProveedor()%>" />
             <br />

             </form> --%>
              <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="navegacion.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Proveedores</title>
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
                <form action = "Proveedores.jsp" method = "GET">
                    <h1><strong>Bienvenido al área de proveedores</strong></h1>
                    <div class="user-details">
                        <div class = "input-box">
                            <span class = "details">NIT</span>
                            <input type="text" name = "nit" placeholder="Ingrese NIT" value="<%= pro.getnitProveedor()%>" />
                        </div>
                        <div class = "input-box">
                            <span class = "details">Tel&eacute;fono</span>
                            <input type="text" name = "telefono" placeholder="Ingrese teléfono" value="<%= pro.gettelefonoProveedor()%>" />
                        </div>  
                        <div class = "input-box">
                            <span class = "details">Nombre proveedor</span>
                            <input type="text" name = "nombre" placeholder="Ingrese nombre" value="<%= pro.getnombreProveedor()%>" />
                        </div>
                        <div class = "input-box">
                            <span class = "details">Ciudad</span>
                            <input type="text" name = "ciudad" placeholder="Ingrese ciudad" value="<%= pro.getciudadProveedor()%>" />
                        </div>
                        <div class = "input-box">
                            <span class = "details">Direcci&oacute;n</span>
                            <input type="text" name = "direccion" placeholder="Ingrese dirección" value="<%= pro.getdireccionProveedor()%>" />
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
  <%	    } 
  		else{ 
  	    	cc.registrarProveedor(pro);
  	    	out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
 	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
             out.println("<script language=JavaScript>");
             out.println("$(document).ready(function(){");
             out.println("swal.fire({title: 'Proveedor Inexistente', icon: 'error'}).then(function(){ window.location = 'proveedores.html';});");
             out.println("});");
             out.println("</script>"); 
  	    }
     }
     else if (opcion.equals("Crear")){ 
    	    ClienteController cc=new ClienteController();
    	    ProveedorVO pro=new ProveedorVO();
    	    //String opcion1=request.getParameter("cedula"); 
    	    //String opcion2=" ";
    	    //if (opcion1){ 
   	    	// String site="http://www.google.com" ; 
   	        // response.setStatus(response.SC_MOVED_TEMPORARILY);
   	        // response.setHeader("Location", site); 
   	        // } 
    	    int id=Integer.parseInt(request.getParameter("nit"));
    		pro.settelefonoProveedor(request.getParameter("telefono"));
    		pro.setnitProveedor (id);    
    		pro.setnombreProveedor(request.getParameter("nombre"));
    		pro.setciudadProveedor(request.getParameter("ciudad"));
    		pro.setdireccionProveedor(request.getParameter("direccion"));
    		if(cc.consultarProveedor(id)){
    			out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
    	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
                out.println("<script language=JavaScript>");
                out.println("$(document).ready(function(){");
                out.println("swal.fire({title: 'Proveedor Ya Existe', icon: 'error'}).then(function(){ window.location = 'proveedores.html';});");
                out.println("});");
                out.println("</script>");
     	    } 
     		else{
     	    	cc.registrarProveedor(pro);
     	    	out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
    	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
                out.println("<script language=JavaScript>");
                out.println("$(document).ready(function(){");
                out.println("swal.fire({title: 'Proveedor Creado', icon: 'success'}).then(function(){ window.location = 'proveedores.html';});");
                out.println("});");
                out.println("</script>");
     	    }
    		
        }
     else if (opcion.equals("Actualizar")){ 
    	 
    	ClienteController cc=new ClienteController();
 	    ProveedorVO pro=new ProveedorVO();
 	    //String opcion1=request.getParameter("cedula"); 
 	    //String opcion2=" ";
 	    //if (opcion1){ 
	    	// String site="http://www.google.com" ; 
	        // response.setStatus(response.SC_MOVED_TEMPORARILY);
	        // response.setHeader("Location", site); 
	        // } 
 	    int id=Integer.parseInt(request.getParameter("nit"));
    		pro.settelefonoProveedor(request.getParameter("telefono"));
    		pro.setnitProveedor (id);    
    		pro.setnombreProveedor(request.getParameter("nombre"));
    		pro.setciudadProveedor(request.getParameter("ciudad"));
    		pro.setdireccionProveedor(request.getParameter("direccion"));
 		if(cc.consultarProveedor(id)){
 			cc.modificarProveedor(pro);
 			out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("<script language=JavaScript>");
            out.println("$(document).ready(function(){");
            out.println("swal.fire({title: 'Datos del Proveedor Actualizados', icon: 'success'}).then(function(){ window.location = 'proveedores.html';});");
            out.println("});");
            out.println("</script>");
 	    } 
 		else{
 	    	 out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
 	    	 out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
             out.println("<script language=JavaScript>");
             out.println("$(document).ready(function(){");
             out.println("swal.fire({title: 'Proveedor Inexistente', icon: 'error'}).then(function(){ window.location = 'proveedores.html';});");
             out.println("});");
             out.println("</script>");
                  
 	    }
 		
       }
     else { 
    	ClienteController cc=new ClienteController();
 	    ProveedorVO pro=new ProveedorVO();
 	    //String opcion1=request.getParameter("cedula"); 
 	    //String opcion2=" ";
 	    //if (opcion1){ 
	    	// String site="http://www.google.com" ; 
	        // response.setStatus(response.SC_MOVED_TEMPORARILY);
	        // response.setHeader("Location", site); 
	        // } 
 	   int id=Integer.parseInt(request.getParameter("nit"));
    		pro.settelefonoProveedor(request.getParameter("telefono"));
    		pro.setnitProveedor (id);    
    		pro.setnombreProveedor(request.getParameter("nombre"));
    		pro.setciudadProveedor(request.getParameter("ciudad"));
    		pro.setdireccionProveedor(request.getParameter("direccion"));
 		if(cc.consultarProveedor(id)){
 	    	cc.eliminarProveedor(pro);
 	    	out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("<script language=JavaScript>");
            out.println("$(document).ready(function(){");
            out.println("swal.fire({title: 'Datos del Proveedor Borrados', icon: 'success'}).then(function(){ window.location = 'proveedores.html';});");
            out.println("});");
            out.println("</script>");
 	    } 
 		else{
 			out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("<script language=JavaScript>");
            out.println("$(document).ready(function(){");
            out.println("swal.fire({title: 'NIT Errado', icon: 'error'}).then(function(){ window.location = 'proveedores.html';});");
            out.println("});");
            out.println("</script>");
 	    }
 	 }
  

 %>
           

 
<%-- 
   ClienteController cc=new ClienteController();
    ClienteVO pro=new ClienteVO();
    int id=Integer.parseInt(request.getParameter("cedula"));
	pro.setnombreUsuario(request.getParameter("usuario"));
	pro.setcedulaUsuario(id);    
	pro.setemailUsuario(request.getParameter("correo"));
	pro.setpassword(request.getParameter("contrasena"));
	pro.setusuario(request.getParameter("nombre"));
	cc.registrarPersona(pro);
	response.sendRedirect("Login.html");

 

    
                   
 
<head>
<title>Page Redirection</title>
</head>

<body>
    <h1>Using GET Method to Read Form Data</h1>
    <ul>
        <li><p>
                <b>First Name:</b>
                <%= request.getParameter("cedula")%>
            </p></li>
        <li><p>
                <b>Last Name:</b>
                <%= request.getParameter("usuario")%>
            </p></li>
        <li><p>
                <b>Last Name:</b>
                <%= request.getParameter("correo")%>
            </p></li>
        <li><p>
                <b>Last Name:</b>
                <%= request.getParameter("contrasena")%>
            </p></li>
        <li><p>
                <b>Last Name:</b>
                <%= request.getParameter("nombre")%>
            </p></li>
    </ul>
</body> 
 --%>
</html>
