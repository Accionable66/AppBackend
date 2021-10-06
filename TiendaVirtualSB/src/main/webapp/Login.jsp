<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaVirtualSB.*,
        com.DTO.TiendaVirtualSB.*"
%>
<html>

<style>
<%@ include file = "style.css" %>
</style>

<% 


    ClienteController cc=new ClienteController();
    ClienteVO cli=new ClienteVO();
    //int id=Integer.parseInt(request.getParameter("idcliente"));
    cli.setusuario(request.getParameter("username"));
    //cli.setIdCliente(id);    
    cli.setpassword(request.getParameter("password"));
    if(cc.loginDePersonas(cli.getusuario(),cli.getpassword())){
    	    	
    	if (cc.consultarPersona(1)){
    		
    		cli.setcedulaUsuario(1);
    		cli.setemailUsuario("cor");
    	    cli.setnombreUsuario("nom");
    	    cli.setpassword("pas");
    	    cli.setusuario("usu");
    	    cc.eliminarPersona(cli);
    		response.sendRedirect("navegacion.html");
    		
    		
    	} else{
    		response.sendRedirect("navegacion.html");
    	}
    } else {
    	
    	out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>");
    	out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
        out.println("<script language=JavaScript>");
        out.println("$(document).ready(function(){");
        out.println("swal.fire({title: 'Usuario Inexistente', icon: 'error'}).then(function(){ window.location = 'Login.html';});");
        out.println("});");
        out.println("</script>"); 
    }
    	
%>

</html>