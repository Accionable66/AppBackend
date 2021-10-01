<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaVirtualSB.*,
        com.DTO.TiendaVirtualSB.*"
%>
<html>

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
    		response.sendRedirect("UsuarioActualiza.html");
    		System.out.println("si");
    		
    	} else{
    		response.sendRedirect("UsuarioActualiza.html");
    	}
    } else {
    	response.sendRedirect("Loginerror.html");
    	String mensaje="error";
    	
    	request.getSession().setAttribute("correo", mensaje);
    }
    	
%>
<head>
<title>Page Redirection</title>
</head>
<body>
    <h1>Using GET Method to Read Form Data</h1>
    <ul>
        <li><p>
                <b>First Name:</b>
                //<%= request.getParameter("nombre")%>
                
            </p></li>
        <li><p>
                <b>Last Name:</b>
                <%= request.getParameter("nombre")%>
            </p></li>
        <li><p>
                <b>Last Name:</b>
                <%= request.getParameter("apellido")%>
            </p></li>
            
    </ul>
</body>
</html>