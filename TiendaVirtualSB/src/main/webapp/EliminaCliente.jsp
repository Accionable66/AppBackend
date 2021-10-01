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
    int id=Integer.parseInt(request.getParameter("cedula"));
    cli.setnombreUsuario(request.getParameter("usuario"));
    cli.setcedulaUsuario(id);    
    cli.setemailUsuario(request.getParameter("correo"));
    cc.eliminarPersona(cli);
    
    
%>
<head>
<title>Page Redirection</title>
</head>
<body>
    <h1>Usuario ha sido borrado</h1>
    <ul>
        <li><p>
                <b>First Name:</b>
                <%= request.getParameter("cedula")%>
            </p></li>
        <li><p>
                <b>Last Name:</b>
                <%= request.getParameter("correo")%>
            </p></li>
        <li><p>
                <b>Last Name:</b>
                <%= request.getParameter("usuario")%>
            </p></li>
    </ul>
</body>
</html>