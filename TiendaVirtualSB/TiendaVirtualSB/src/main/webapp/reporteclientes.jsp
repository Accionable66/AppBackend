<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="navegacion.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script
	src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/flick/jquery-ui.css">
	<title>Registered Users</title>
	
</head>

<script>
        
    var saveme =  $.ajax({
        type: "POST",
        url: "http://localhost:8080/listarClientesTotal", //nombre del archivo php que consultaremos.
      
        success: function(data) {
          $.each(data, function(i, item) {
          lista = document.getElementById("myTable");
          var tr = document.createElement("tr");
          var columna1 = document.createElement("th")
          columna1.innerHTML = item.cedula_cliente;
          var columna2 = document.createElement("th")
          columna2.innerHTML = item.direccion_cliente;
          var columna3 = document.createElement("th")
          columna3.innerHTML = item.email_cliente;
          var columna4 = document.createElement("th")
          columna4.innerHTML = item.nombre_cliente;
          var columna5 = document.createElement("th")
          columna5.innerHTML = item.telefono_cliente;
        
          lista.appendChild(tr);
          tr.appendChild(columna1);
          tr.appendChild(columna2);
          tr.appendChild(columna3);
          tr.appendChild(columna4);
          tr.appendChild(columna5);
       
         });
        }
      });
    
    </script>

<body>
<header class="header">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                <a href="#" class="navbar-brand">
                    Tienda gen�rica                 
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
                    <a style="color:white;" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar sesi�n</a>
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
		<h1><strong>Listado de Clientes</strong></h1>
			<table id="tabla" class="table table-striped" style="margin-top: 50px;">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Cedula Cliente</th>
						<th scope="col">Direcci�n Cliente</th>
						<th scope="col">Email Cliente</th>
						<th scope="col">Nombre Cliente</th>
						<th scope="col">Tel�fono Cliente</th>
					</tr>
				</thead>
				<tbody id="myTable">
				</tbody>
			</table>
		</div>

	</div>


</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>                  
</html>