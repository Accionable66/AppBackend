package com.DAO.TiendaVirtualSB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import com.BO.TiendaVirtualSB.*;
import com.DTO.TiendaVirtualSB.CClienteVO2;
import com.DTO.TiendaVirtualSB.ClienteVO;
import com.DTO.TiendaVirtualSB.ProveedorVO;


/**
 * Clase que permite el acceso a la base de datos
 * 
 *
 */
public class ClienteDAO 
{

 /**
  * Permite registrar un Cliente nuevo
  * @param persona
  */
	
	
 public void registrarPersona(ClienteVO persona) 
 {
  Conexion conex= new Conexion();
  try {
   Statement estatuto = conex.getConnection().createStatement();
   estatuto.executeUpdate("INSERT INTO usuarios VALUES ('"+persona.getcedulaUsuario()+"','"+persona.getemailUsuario()+"','"
     +persona.getnombreUsuario()+"','"+persona.getpassword()+"','"+persona.getusuario()+"')");
   //persona.setflag(true);
   //JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamente","Información",JOptionPane.INFORMATION_MESSAGE);
   estatuto.close();
   conex.desconectar();
   
   
  } catch (SQLException e) {
            System.out.println(e.getMessage());
   //JOptionPane.showMessageDialog(null, "No se Registro la persona");
  }
  
 }
   
 public void modificarPersona(ClienteVO persona) 
 {
  Conexion conex= new Conexion();
  try {
   Statement estatuto = conex.getConnection().createStatement();
   estatuto.executeUpdate("UPDATE usuarios SET email_usuario='"+persona.getemailUsuario()+"',nombre_usuario='"+persona.getnombreUsuario()+"',password='"+persona.getpassword()+"' WHERE cedula_usuario='"+persona.getcedulaUsuario()+"'");
   //JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamente","Información",JOptionPane.INFORMATION_MESSAGE);
   estatuto.close();
   conex.desconectar();
   
  } catch (SQLException e) {
            System.out.println(e.getMessage());
   //JOptionPane.showMessageDialog(null, "No se Registro la persona");
  }
 }
 
 public void eliminarPersona(ClienteVO persona) 
 {
  Conexion conex= new Conexion();
  try {
   Statement estatuto = conex.getConnection().createStatement();
   estatuto.executeUpdate("DELETE FROM usuarios WHERE cedula_usuario='"+persona.getcedulaUsuario()+"'");
   //JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamente","Información",JOptionPane.INFORMATION_MESSAGE);
   estatuto.close();
   conex.desconectar();
   
  } catch (SQLException e) {
            System.out.println(e.getMessage());
   //JOptionPane.showMessageDialog(null, "No se Registro la persona");
  }
 }
 
 
/**
 * permite consultar el Cliente asociado al documento enviado
 * como parametro 
 * @param documento 
 * @return
 */
public boolean consultarPersona(Integer cedula) {
  ArrayList< ClienteVO> miCliente = new ArrayList< ClienteVO>();
  Conexion conex= new Conexion();
    
  try {
   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios where cedula_usuario = ? ");
   consulta.setInt(1, cedula);
   ResultSet res = consulta.executeQuery();
   
  if(res.next()){
    ClienteVO persona= new ClienteVO();
    persona.setcedulaUsuario(Integer.parseInt(res.getString("cedula_usuario")));
    persona.setemailUsuario(res.getString("email_usuario"));
    persona.setnombreUsuario(res.getString("nombre_usuario"));
    persona.setpassword(res.getString("password"));
    persona.setusuario(res.getString("usuario"));
    System.out.println("Usuario okk");
    miCliente.add(persona);
    res.close();
    consulta.close();
    conex.desconectar();
    return true;
          }
  else {
	  res.close();
	  consulta.close();
	  conex.desconectar();
	return false;
  }
   
    
   
  } catch (Exception e) {
   //JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n"+e);
  }
  return false;
 }



/**
 * permite consultar la lista de Clientes
 * @return
 */
public ArrayList< ClienteVO> listaDePersonas() {
  ArrayList< ClienteVO> miCliente = new ArrayList< ClienteVO>();
  Conexion conex= new Conexion();
    
  try {
   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios ");
   ResultSet res = consulta.executeQuery();
   while(res.next()){
    ClienteVO persona= new ClienteVO();
    persona.setcedulaUsuario(Integer.parseInt(res.getString("cedula_usuario")));
    persona.setemailUsuario(res.getString("email_usuario"));
    persona.setnombreUsuario(res.getString("nombre_usuario"));
    persona.setpassword(res.getString("password"));
    persona.setusuario(res.getString("usuario"));
    System.out.println(""+res.getString("cedula_usuario")+","+res.getString("email_usuario")+" , "+res.getString("nombre_usuario")+"");

    miCliente.add(persona);
          }
          res.close();
          consulta.close();
          conex.desconectar();
   
  } catch (Exception e) {
   //JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n"+e);
  }
  return miCliente;
 }

public boolean loginDePersonas(String usuario, String password) {
	  ArrayList< ClienteVO> miCliente = new ArrayList< ClienteVO>();
	  Conexion conex= new Conexion();
	  	    
	  try {
	   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios WHERE usuario=? and password=? ");
	   consulta.setString(1, usuario);
	   consulta.setString(2, password);
	   ResultSet res = consulta.executeQuery();
	   
	   if(res.next()){
	    ClienteVO persona= new ClienteVO();
	    persona.setcedulaUsuario(Integer.parseInt(res.getString("cedula_usuario")));
	    persona.setemailUsuario(res.getString("email_usuario"));
	    persona.setnombreUsuario(res.getString("nombre_usuario"));
	    persona.setpassword(res.getString("password"));
	    persona.setusuario(res.getString("usuario"));
	    System.out.println(""+res.getString("cedula_usuario")+","+res.getString("email_usuario")+" , "+res.getString("nombre_usuario")+"");
	    miCliente.add(persona);
	    //if(res.absolute(1))
	    System.out.println("Usuario ok");
	    return true;
	          }
	          res.close();
	          consulta.close();
	          conex.desconectar();
	   
	  } catch (Exception e) {
	   //JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n"+e);
	  }
	  
	  return false;
	 }
public ClienteVO listaDePersonas1(int cedula) {
	  ClienteVO miCliente = new ClienteVO();
	  Conexion conex= new Conexion();
	    
	  try {
	   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios WHERE cedula_usuario = ? ");
	   consulta.setInt(1, cedula);
	   ResultSet res = consulta.executeQuery();
	   if(res.next()){
	    ClienteVO persona= new ClienteVO();
	    persona.setcedulaUsuario(Integer.parseInt(res.getString("cedula_usuario")));
	    persona.setemailUsuario(res.getString("email_usuario"));
	    persona.setnombreUsuario(res.getString("nombre_usuario"));
	    persona.setpassword(res.getString("password"));
	    persona.setusuario(res.getString("usuario"));
	    System.out.println(""+res.getString("cedula_usuario")+","+res.getString("email_usuario")+" , "+res.getString("nombre_usuario")+"");
	    System.out.println("Usuario paso");
	    miCliente=persona;
	          }
	          res.close();
	          consulta.close();
	          conex.desconectar();
	   
	  } catch (Exception e) {
	   //JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n"+e);
	  }
	  return miCliente;
	 }

public void registrarProveedor(ProveedorVO proveedor) 
{
 Conexion conex= new Conexion();
 try {
  Statement estatuto = conex.getConnection().createStatement();
  estatuto.executeUpdate("INSERT INTO proveedores VALUES ('"+proveedor.getnitProveedor()+"','"+proveedor.getciudadProveedor()+"','"
    +proveedor.getdireccionProveedor()+"','"+proveedor.getnombreProveedor()+"','"+proveedor.gettelefonoProveedor()+"')");
  //Proveedor.setflag(true);
  //JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamente","Información",JOptionPane.INFORMATION_MESSAGE);
  estatuto.close();
  conex.desconectar();
  
  
 } catch (SQLException e) {
           System.out.println(e.getMessage());
  //JOptionPane.showMessageDialog(null, "No se Registro Proveedor");
 }
 
}
  
public void modificarProveedor(ProveedorVO proveedor) 
{
 Conexion conex= new Conexion();
 try {
  Statement estatuto = conex.getConnection().createStatement();
  estatuto.executeUpdate("UPDATE proveedores SET ciudad_proveedor='"+ proveedor.getciudadProveedor()+"',direccion_proveedor='"+proveedor.getdireccionProveedor()+"',nombre_proveedor='"+proveedor.getnombreProveedor()+"',telefono_proveedor='"+proveedor.gettelefonoProveedor()+"'  WHERE nitproveedor='"+proveedor.getnitProveedor()+"'");
  //JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamente","Información",JOptionPane.INFORMATION_MESSAGE);
  estatuto.close();
  conex.desconectar();
  
 } catch (SQLException e) {
           System.out.println(e.getMessage());
  //JOptionPane.showMessageDialog(null, "No se Registro Proveedor");
 }
}

public void eliminarProveedor(ProveedorVO proveedor) 
{
 Conexion conex= new Conexion();
 try {
  Statement estatuto = conex.getConnection().createStatement();
  estatuto.executeUpdate("DELETE FROM proveedores WHERE nitproveedor='"+proveedor.getnitProveedor()+"'");
  //JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamente","Información",JOptionPane.INFORMATION_MESSAGE);
  estatuto.close();
  conex.desconectar();
  
 } catch (SQLException e) {
           System.out.println(e.getMessage());
  //JOptionPane.showMessageDialog(null, "No se Registro Proveedor");
 }
}


/**
* permite consultar el Proveedor asociado al documento enviado
* como parametro 
* @param documento 
* @return
*/
public boolean consultarProveedor(Integer nit) {
 ArrayList< ProveedorVO> miProveedor = new ArrayList< ProveedorVO>();
 Conexion conex= new Conexion();
   
 try {
  PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM proveedores where nitproveedor = ? ");
  consulta.setInt(1, nit);
  ResultSet res = consulta.executeQuery();
  
 if(res.next()){
   ProveedorVO proveedor= new ProveedorVO();
   proveedor.setnitProveedor(Integer.parseInt(res.getString("nitproveedor")));
   proveedor.settelefonoProveedor (res.getString("ciudad_proveedor"));
   proveedor.setnombreProveedor (res.getString("direccion_proveedor"));
   proveedor.setciudadProveedor (res.getString("nombre_proveedor"));
   proveedor.setdireccionProveedor (res.getString("telefono_proveedor"));
   System.out.println("Usuario okk");
   miProveedor.add(proveedor);
   res.close();
   consulta.close();
   conex.desconectar();
   return true;
         }
 else {
	  res.close();
	  consulta.close();
	  conex.desconectar();
	return false;
 }
  
   
  
 } catch (Exception e) {
  //JOptionPane.showMessageDialog(null, "no se pudo consultar Proveedor\n"+e);
 }
 return false;
}



/**
* permite consultar la lista de Proveedores
* @return
*/
public ArrayList< ProveedorVO> listaDeProveedores() {
 ArrayList< ProveedorVO> miProveedor = new ArrayList< ProveedorVO>();
 Conexion conex= new Conexion();
   
 try {
  PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios ");
  ResultSet res = consulta.executeQuery();
  while(res.next()){
   ProveedorVO proveedor= new ProveedorVO();
   proveedor.setnitProveedor(Integer.parseInt(res.getString("nitproveedor")));
   proveedor.settelefonoProveedor (res.getString("telefono_proveedor"));
   proveedor.setnombreProveedor (res.getString("nombre_proveedor"));
   proveedor.setciudadProveedor (res.getString("ciudad_proveedor"));
   proveedor.setdireccionProveedor (res.getString("direccion_proveedor"));
   System.out.println(""+res.getString("nit_proveedor")+","+res.getString("telefono_proveedor")+" , "+res.getString("ciudad_proveedor")+" , "+res.getString("direccion_proveedor")+"");


   miProveedor.add(proveedor);
         }
         res.close();
         consulta.close();
         conex.desconectar();
  
 } catch (Exception e) {
  //JOptionPane.showMessageDialog(null, "no se pudo consultar Proveedor\n"+e);
 }
 return miProveedor;
}

public ProveedorVO listaDeProveedores1(int nit) {
	  ProveedorVO miProveedor = new ProveedorVO();
	  Conexion conex= new Conexion();
	    
	  try {
	   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM proveedores WHERE nitproveedor= ? ");
	   consulta.setInt(1, nit);
	   ResultSet res = consulta.executeQuery();
	   if(res.next()){
	    ProveedorVO proveedor= new ProveedorVO();
	    proveedor.setnitProveedor(Integer.parseInt(res.getString("nitproveedor")));
	    proveedor.settelefonoProveedor (res.getString("telefono_proveedor"));
	    proveedor.setnombreProveedor (res.getString("nombre_proveedor"));
	    proveedor.setciudadProveedor (res.getString("ciudad_proveedor"));
	    proveedor.setdireccionProveedor (res.getString("direccion_proveedor"));
	    System.out.println(""+res.getString("nitproveedor")+","+res.getString("telefono_proveedor")+" , "+res.getString("ciudad_proveedor")+" , "+res.getString("direccion_proveedor")+"");
	    System.out.println("Proveedor paso");
	    miProveedor=proveedor;
	          }
	          res.close();
	          consulta.close();
	          conex.desconectar();
	   
	  } catch (Exception e) {
	   //JOptionPane.showMessageDialog(null, "no se pudo consultar la Proveedor\n"+e);
	  }
	  return miProveedor;
	 }

/**
 * Permite registrar un Cliente nuevo
 * 
 * @param cliente
 */

public void registrarcliente(CClienteVO2 cliente) {
	Conexion conex = new Conexion();
	try {
		Statement estatuto = conex.getConnection().createStatement();
		estatuto.executeUpdate("INSERT INTO clientes VALUES ('" + cliente.getcedula_cliente() + "','"
				+ cliente.getdireccion_cliente() + "','" + cliente.getemail_cliente() + "','"
				+ cliente.getnombre_cliente() + "','" + cliente.gettelefono_cliente() + "')");
		estatuto.close();
		conex.desconectar();

	} catch (SQLException e) {
		System.out.println(e.getMessage());

	}
}
/**
 * Permite modificar un cliente
 * 
 * @param cliente
 */
public void modificarcliente(CClienteVO2 cliente) {
	Conexion conex = new Conexion();
	try {
		Statement estatuto = conex.getConnection().createStatement();
		estatuto.executeUpdate("UPDATE clientes SET direccion_cliente='" + cliente.getdireccion_cliente()
				+ "',telefono_cliente='" + cliente.gettelefono_cliente() + "',email_cliente='"
				+ cliente.getemail_cliente() + "',nombre_cliente='" + cliente.getnombre_cliente()
				+ "' WHERE cedula_cliente='" + cliente.getcedula_cliente() + "'");

		estatuto.close();
		conex.desconectar();

	} catch (SQLException e) {
		System.out.println(e.getMessage());

	}
}

/**
 * Permite eliminar un cliente
 * 
 * @param cliente
 */
public void eliminarcliente(CClienteVO2 cliente) {
	Conexion conex = new Conexion();
	try {
		Statement estatuto = conex.getConnection().createStatement();
		estatuto.executeUpdate("DELETE FROM clientes WHERE cedula_cliente='" + cliente.getcedula_cliente() + "'");

		estatuto.close();
		conex.desconectar();

	} catch (SQLException e) {
		System.out.println(e.getMessage());

	}
}

/**
 * permite consultar el Cliente asociado al documento enviado como parametro
 * 
 * @param documento
 * @return
 */
public boolean consultarcliente(Integer cedula) {
	ArrayList<CClienteVO2> miCliente = new ArrayList<CClienteVO2>();
	Conexion conex = new Conexion();

	try {
		PreparedStatement consulta = conex.getConnection()
				.prepareStatement("SELECT * FROM clientes where cedula_cliente = ? ");
		consulta.setInt(1, cedula);
		ResultSet res = consulta.executeQuery();

		if (res.next()) {
			CClienteVO2 cliente = new CClienteVO2();
			cliente.setcedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
			cliente.setdireccion_cliente(res.getString("direccion_cliente"));
			cliente.setemail_cliente(res.getString("email_cliente"));
			cliente.setnombre_cliente(res.getString("nombre_cliente"));
			cliente.settelefono_cliente(res.getString("telefono_cliente"));

			miCliente.add(cliente);
			res.close();
			consulta.close();
			conex.desconectar();
			return true;
		} else {
			res.close();
			consulta.close();
			conex.desconectar();
			return false;
		}

	} catch (Exception e) {

	}
	return false;
}
/**
 * permite consultar la lista de Clientes
 * 
 * @return
 */

public CClienteVO2 listaDeClientes1(int cedula) {
	CClienteVO2 miCliente = new CClienteVO2();
	Conexion conex = new Conexion();

	try {
		PreparedStatement consulta = conex.getConnection()
				.prepareStatement("SELECT * FROM clientes WHERE cedula_cliente = ? ");
		consulta.setInt(1, cedula);
		ResultSet res = consulta.executeQuery();
		if (res.next()) {
			CClienteVO2 cliente = new CClienteVO2();
			cliente.setcedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
			cliente.setdireccion_cliente(res.getString("direccion_cliente"));
			cliente.setemail_cliente(res.getString("email_cliente"));
			cliente.setnombre_cliente(res.getString("nombre_cliente"));
			cliente.settelefono_cliente(res.getString("telefono_cliente"));
			System.out.println("" + res.getString("cedula_cliente") + "," + res.getString("direccion_cliente")
					+ " , " + res.getString("email_cliente") + "");
			System.out.println("Cliente paso");
			miCliente = cliente;
		}
		res.close();
		consulta.close();
		conex.desconectar();

	} catch (Exception e) {

	}
	return miCliente;
}

}