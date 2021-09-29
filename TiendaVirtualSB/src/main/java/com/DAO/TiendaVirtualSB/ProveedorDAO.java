package com.DAO.TiendaVirtualSB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import com.BO.TiendaVirtualSB.*;
import com.DTO.TiendaVirtualSB.ProveedorVO;


/**
 * Clase que permite el acceso a la base de datos
 * 
 *
 */

public class ProveedorDAO {
	
	 /**
	  * Permite registrar un nuevo proveedor
	  * @param proveedor
	  */
		
		
	 public void registrarProveedor(ProveedorVO proveedor) 
	 {
	  Conexion conex= new Conexion();
	  try {
	   Statement estatuto = conex.getConnection().createStatement();
	   estatuto.executeUpdate("INSERT INTO proveedores VALUES ('"+proveedor.getnitProveedor()+"','"+proveedor.getnombreProveedor()+"','"
	     +proveedor.getdireccionProveedor()+"','"+proveedor.gettelefonoProveedor()+"','"+proveedor.getciudadProveedor()+"')");
	   estatuto.close();
	   conex.desconectar();
	   
	   
	  } catch (SQLException e) {
	            System.out.println(e.getMessage());
	  }
	  
	 }
	   
	 public void modificarProveedor(ProveedorVO proveedor) 
	 {
	  Conexion conex= new Conexion();
	  try {
	   Statement estatuto = conex.getConnection().createStatement();
	   estatuto.executeUpdate("UPDATE proveedores SET nombre_proveedor='"+proveedor.getnombreProveedor()+"',direccion_proveedor='"+proveedor.getdireccionProveedor()+"', telefono_proveedor='"+proveedor.gettelefonoProveedor()+"',ciudad_proveedor='"+proveedor.getciudadProveedor()+"' WHERE nitproveedor='"+proveedor.getnitProveedor()+"'");
	   estatuto.close();
	   conex.desconectar();
	   
	  } catch (SQLException e) {
	            System.out.println(e.getMessage());
	  }
	 }
	 
	 public void eliminarProveedor(ProveedorVO proveedor) 
	 {
	  Conexion conex= new Conexion();
	  try {
	   Statement estatuto = conex.getConnection().createStatement();
	   estatuto.executeUpdate("DELETE FROM usuarios WHERE nitproveedor='"+proveedor.getnitProveedor()+"'");
	   estatuto.close();
	   conex.desconectar();
	   
	  } catch (SQLException e) {
	            System.out.println(e.getMessage());
	  }
	 }
	 
	 
	/**
	 * permite consultar el Proveedor asociado al nit enviado
	 * como parametro 
	 * @param nit 
	 * @return
	 */

	public boolean consultarProveedor(String nombre) {
	 ArrayList< ProveedorVO> miProveedor = new ArrayList< ProveedorVO>();
	  Conexion conex= new Conexion(); 
	    
	  try {
	   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM provedores where usuario = ? ");
	   consulta.setString(1, nombre);
	   ResultSet res = consulta.executeQuery();
	   
	  if(res.next()){
	    ProveedorVO proveedor= new ProveedorVO();
	    proveedor.setnitProveedor(Integer.parseInt(res.getString("nitproveedor")));
	    proveedor.setnombreProveedor(res.getString("nombre_proveedor"));
	    proveedor.setdireccionProveedor(res.getString("direccion_proveedor"));
	    proveedor.settelefonoProveedor(res.getString("telefono_proveedor"));
	    proveedor.setciudadProveedor(res.getString("ciudad_proveedor"));
	 
	    miProveedor.add(proveedor);
	          }
	          res.close();
	          consulta.close();
	          conex.desconectar();
	    return true;
	   
	  } catch (Exception e) {
	  }

	  return false;
	 }


	/**
	 * permite consultar la lista de Proveedores
	 * @return
	 */
	public ArrayList<ProveedorVO> listaDeProveedores() {
	  ArrayList< ProveedorVO> miProveedor = new ArrayList< ProveedorVO>();
	  Conexion conex= new Conexion();

	  try {
	   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM proveedores");
	   ResultSet res = consulta.executeQuery();
	   while(res.next()){
	    ProveedorVO proveedor= new ProveedorVO();
	    proveedor.setnitProveedor(Integer.parseInt(res.getString("nitproveedor")));
	    proveedor.setnombreProveedor(res.getString("nombre_proveedor"));
	    proveedor.setdireccionProveedor(res.getString("direccion_proveedor"));
	    proveedor.settelefonoProveedor(res.getString("telefono_proveedor"));
	    proveedor.setciudadProveedor(res.getString("ciudad_proveedor"));
	    System.out.println(""+res.getString("nitproveedor")+","+res.getString("nombre_proveedor")+res.getString("direccion_proveedor")+" , "+res.getString("telefono_proveedor")+","+res.getString("ciudad_proveedor")+"");

	    miProveedor.add(proveedor);
	          }
	          res.close();
	          consulta.close();
	          conex.desconectar();
	   
	  } catch (Exception e) {
	  }
	  return miProveedor;
	 }

}
