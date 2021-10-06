<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaVirtualSB.*,
        com.DTO.TiendaVirtualSB.*"
%>
<html lang="en">
<head>
<style>
 <%@ include file = "style.css" %>

</style>
</head>

 <% String opcion=request.getParameter("boton"); 
       
	 if (opcion.equals("Consultar")){
		 ClienteController cc=new ClienteController();
	     ClienteVO cli=new ClienteVO();
	     //int id=Integer.parseInt(request.getParameter("cedula"));
	  	 //cli.setcedulaUsuario(id);
	  	 
	  	 String s = request.getParameter("cedula");
	  	 if(s.isEmpty() || s.isBlank()){
	  			 
	  			String page1 = ""; 
	  			try {
		    		 	  	 	    	
	  				int id=Integer.parseInt(request.getParameter("cedula"));
	  				                 
                 } 
                catch (NumberFormatException e) { 
		      
		              System.out.println("no es numero"); 
		         }
	  			finally{
	  				page1 = "UsuarioActualiza.html";
	  				  				
	  			}
	  		    out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	  		    out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
	  		    out.println("<script language=JavaScript>");
	  		    out.println("$(document).ready(function(){");
	  		    out.println("swal.fire({title: 'Faltan Datos', icon: 'error'});");
	  		    out.println("});");
	  		    out.println("</script>"); 	
	  		    //RequestDispatcher dd=request.getRequestDispatcher(page1);
	  		    //dd.forward(request, response);
	  		    response.sendRedirect(page1);
	  		 
	  		}
	  		else{
	  		 
	  			   	 	     
	  		}
	  		
				
		  int id=Integer.parseInt(request.getParameter("cedula"));
		  //ClienteController cc=new ClienteController();
	      //ClienteVO cli=new ClienteVO();
		  cli.setcedulaUsuario(id);   
 		 if(cc.consultarPersona(id)){ 
 			 cli=cc.listaDePersonas1(id);
 			 out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
 	    	 out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
             out.println("<script language=JavaScript>");
             out.println("$(document).ready(function(){");
             out.println("swal.fire({title: 'Usuario Encontrado', icon: 'success'});");
             out.println("});");
             out.println("</script>");%> 
        <%--      <form action="UsuarioActualiza.html" method="POST">
             ID: <input type="text" name="cedula" value="<%= cli.getcedulaUsuario()%>" />
             <br />
             Email: <input type="text" name="correo" value="<%= cli.getemailUsuario()%>" />
             <br />
             Nom_usu: <input type="text" name="nombre" value="<%= cli.getnombreUsuario()%>" />
             <br />
             Usuario: <input type="text" name="usuario" value="<%= cli.getusuario()%>" />
             <br />
             </form> --%>
            <html lang="en">

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
                <form action = "UsuarioActualiza.jsp" method = "GET">
                    <h1><strong>Bienvenido al área de usuarios</strong></h1>
                    <div class="user-details">
                        <div class = "input-box">
                            <span class = "details">C&eacute;dula</span>
                            <input type="text" name = "cedula" placeholder="Ingrese c&eacute;dula" value="<%= cli.getcedulaUsuario()%>">
                        </div>
                        <div class = "input-box">
                            <span class = "details">Usuario</span>
                            <input type="text" name = "usuario" placeholder="Ingrese usuario" value="<%= cli.getusuario()%>">
                        </div>  
                        <div class = "input-box">
                            <span class = "details">Correo electr&oacute;nico</span>
                            <input type="text" name = "correo" placeholder="Ingrese correo" value="<%= cli.getemailUsuario()%>">
                        </div>
                        <div class = "input-box">
                            <span class = "details">Contrase&ntilde;a</span>
                            <input type="password" name = "contrasena" placeholder="Ingrese contrase&ntilde;a" >
                        </div>
                        <div class = "input-box">
                            <span class = "details">Nombre completo</span>
                            <input type="text" name = "nombre" name = "nombre" placeholder="Ingrese nombre" value="<%= cli.getnombreUsuario()%>">
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
  <%	    } 
  		else{ 
  	    	 cc.registrarPersona(cli);
  	    	 out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
 	    	 out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
             out.println("<script language=JavaScript>");
             out.println("$(document).ready(function(){");
             out.println("swal.fire({title: 'Usuario Inexistente', icon: 'error'}).then(function(){ window.location = 'UsuarioActualiza.html';});");
             out.println("});");
             out.println("</script>"); 
  	    }
     }
     else if (opcion.equals("Crear")){ 
    	    ClienteController cc=new ClienteController();
    	    ClienteVO cli=new ClienteVO();
    	    //String opcion1=request.getParameter("cedula"); 
    	    //String opcion2=" ";
    	    //if (opcion1){ 
   	    	// String site="http://www.google.com" ; 
   	        // response.setStatus(response.SC_MOVED_TEMPORARILY);
   	        // response.setHeader("Location", site); 
   	        // } 
    	    int id=Integer.parseInt(request.getParameter("cedula"));
    		cli.setnombreUsuario(request.getParameter("usuario"));
    		cli.setcedulaUsuario(id);    
    		cli.setemailUsuario(request.getParameter("correo"));
    		cli.setpassword(request.getParameter("contrasena"));
    		cli.setusuario(request.getParameter("nombre"));
    		if(cc.consultarPersona(id)){
    			out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
    	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
                out.println("<script language=JavaScript>");
                out.println("$(document).ready(function(){");
                out.println("swal.fire({title: 'Usuario Ya Existe', icon: 'error'}).then(function(){ window.location = 'UsuarioActualiza.html';});");
                out.println("});");
                out.println("</script>");
     	    } 
     		else{
     	    	cc.registrarPersona(cli);
     	    	out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
    	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
                out.println("<script language=JavaScript>");
                out.println("$(document).ready(function(){");
                out.println("swal.fire({title: 'Usuario Creado', icon: 'success'}).then(function(){ window.location = 'UsuarioActualiza.html';});");
                out.println("});");
                out.println("</script>");
     	    }
    		
        }
     else if (opcion.equals("Actualizar")){ 
    	 
    	ClienteController cc=new ClienteController();
 	    ClienteVO cli=new ClienteVO();
 	    //String opcion1=request.getParameter("cedula"); 
 	    //String opcion2=" ";
 	    //if (opcion1){ 
	    	// String site="http://www.google.com" ; 
	        // response.setStatus(response.SC_MOVED_TEMPORARILY);
	        // response.setHeader("Location", site); 
	        // } 
 	    int id=Integer.parseInt(request.getParameter("cedula"));
 		cli.setnombreUsuario(request.getParameter("usuario"));
 		cli.setcedulaUsuario(id);    
 		cli.setemailUsuario(request.getParameter("correo"));
 		cli.setpassword(request.getParameter("contrasena"));
 		cli.setusuario(request.getParameter("nombre"));
 		if(cc.consultarPersona(id)){
 			cc.modificarPersona(cli);
 			out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("<script language=JavaScript>");
            out.println("$(document).ready(function(){");
            out.println("swal.fire({title: 'Datos del Usuario Actualizados', icon: 'success'}).then(function(){ window.location = 'UsuarioActualiza.html';});");
            out.println("});");
            out.println("</script>");
 	    } 
 		else{
 	    	 out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
 	    	 out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
             out.println("<script language=JavaScript>");
             out.println("$(document).ready(function(){");
             out.println("swal.fire({title: 'Usuario No Existe', icon: 'error'}).then(function(){ window.location = 'UsuarioActualiza.html';});");
             out.println("});");
             out.println("</script>");
                  
 	    }
 		
       }
     else { 
    	ClienteController cc=new ClienteController();
 	    ClienteVO cli=new ClienteVO();
 	    //String opcion1=request.getParameter("cedula"); 
 	    //String opcion2=" ";
 	    //if (opcion1){ 
	    	// String site="http://www.google.com" ; 
	        // response.setStatus(response.SC_MOVED_TEMPORARILY);
	        // response.setHeader("Location", site); 
	        // } 
 	    int id=Integer.parseInt(request.getParameter("cedula"));
 		cli.setnombreUsuario(request.getParameter("usuario"));
 		cli.setcedulaUsuario(id);    
 		cli.setemailUsuario(request.getParameter("correo"));
 		cli.setpassword(request.getParameter("contrasena"));
 		cli.setusuario(request.getParameter("nombre"));
 		if(cc.consultarPersona(id)){
 	    	cc.eliminarPersona(cli);
 	    	out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("<script language=JavaScript>");
            out.println("$(document).ready(function(){");
            out.println("swal.fire({title: 'Datos del Usuario Borrados', icon: 'success'}).then(function(){ window.location = 'UsuarioActualiza.html';});");
            out.println("});");
            out.println("</script>");
 	    } 
 		else{
 			out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
	    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            out.println("<script language=JavaScript>");
            out.println("$(document).ready(function(){");
            out.println("swal.fire({title: 'Cédula Errada', icon: 'error'}).then(function(){ window.location = 'UsuarioActualiza.html';});");
            out.println("});");
            out.println("</script>");
 	    }
 	 }
  

 %>
           

 
<%-- 
   ClienteController cc=new ClienteController();
    ClienteVO cli=new ClienteVO();
    int id=Integer.parseInt(request.getParameter("cedula"));
	cli.setnombreUsuario(request.getParameter("usuario"));
	cli.setcedulaUsuario(id);    
	cli.setemailUsuario(request.getParameter("correo"));
	cli.setpassword(request.getParameter("contrasena"));
	cli.setusuario(request.getParameter("nombre"));
	cc.registrarPersona(cli);
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