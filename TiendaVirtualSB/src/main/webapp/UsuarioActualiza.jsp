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
 	    ClienteVO cli=new ClienteVO();
 	    //String opcion1=request.getParameter("cedula"); 
 	    //String opcion2=" ";
 	    //if (opcion1){ 
	    	// String site="http://www.google.com" ; 
	        // response.setStatus(response.SC_MOVED_TEMPORARILY);
	        // response.setHeader("Location", site); 
	        // } 
 	    int id=Integer.parseInt(request.getParameter("cedula"));
 		//cli.setnombreUsuario(request.getParameter("usuario"));
 		cli.setcedulaUsuario(id);    
 		//cli.setemailUsuario(request.getParameter("correo"));
 		//cli.setpassword(request.getParameter("contrasena"));
 		//cli.setusuario(request.getParameter("nombre")); 
 		if(cc.consultarPersona(id)){ 
 			 cli=cc.listaDePersonas1(id);
 			 out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
 	    	 out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
             out.println("<script language=JavaScript>");
             out.println("$(document).ready(function(){");
             out.println("swal.fire({title: 'Usuario Encontrado', icon: 'success'});");
             out.println("});");
             out.println("</script>");%>
             <form action="UsuarioActualiza.html" method="POST">
             ID: <input type="text" name="cedula" value="<%= cli.getcedulaUsuario()%>" />
             <br />
             Email: <input type="text" name="correo" value="<%= cli.getemailUsuario()%>" />
             <br />
             Nom_usu: <input type="text" name="nombre" value="<%= cli.getnombreUsuario()%>" />
             <br />
             Usuario: <input type="text" name="usuario" value="<%= cli.getusuario()%>" />
             <br />
             </form> 
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