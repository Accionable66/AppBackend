package com.DAO.TiendaVirtualSB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import com.BO.TiendaVirtualSB.*;
import com.DTO.TiendaVirtualSB.CClienteVO2;


/**
 * Clase que permite el acceso a la base de datos
 * 
 *
 */
public class CClienteDAO2 
{

 /**
  * Permite registrar un Cliente nuevo
  * @param cliente
  */
	
	
 public void registrarcliente(CClienteVO2 cliente) 
 {
  Conexion conex= new Conexion();
  try {
   Statement estatuto = conex.getConnection().createStatement();
   estatuto.executeUpdate("INSERT INTO clientes VALUES ('"+cliente.getcedula_cliente()+"','"+cliente.getdireccion_cliente()+"','"
     +cliente.getemail_cliente()+"','"+cliente.getnombre_cliente()+"','"+cliente.gettelefono_cliente()+"')");
    estatuto.close();
   conex.desconectar();
   
   
  } catch (SQLException e) {
            System.out.println(e.getMessage());

  }
  
 }
   /**
    * Permite modificar un cliente
    * @param cliente
    */
 public void modificarcliente(CClienteVO2 cliente) 
 {
  Conexion conex= new Conexion();
  try {
   Statement estatuto = conex.getConnection().createStatement();
   estatuto.executeUpdate("UPDATE clientes SET direccion_cliente='"+cliente.getdireccion_cliente()+"',telefono_cliente='"+cliente.gettelefono_cliente()+"',email_cliente='"+cliente.getemail_cliente()+"',nombre_cliente='"+cliente.getnombre_cliente()+"' WHERE cedula_cliente='"+cliente.getcedula_cliente()+"'");
  
   estatuto.close();
   conex.desconectar();
   
  } catch (SQLException e) {
            System.out.println(e.getMessage());
  
  }
 }
 
 /**
  * Permite eliminar un cliente
  * @param cliente
  */
 public void eliminarcliente(CClienteVO2 cliente) 
 {
  Conexion conex= new Conexion();
  try {
   Statement estatuto = conex.getConnection().createStatement();
   estatuto.executeUpdate("DELETE FROM clientes WHERE cedula_cliente='"+cliente.gettelefono_cliente()+"'");
   
   estatuto.close();
   conex.desconectar();
   
  } catch (SQLException e) {
            System.out.println(e.getMessage());
   
  }
 }
 
 
/**
 * permite consultar el Cliente asociado al documento enviado
 * como parametro 
 * @param documento 
 * @return
 */
public boolean consultarcliente(String nombre) {
  ArrayList< CClienteVO2> miCliente = new ArrayList< CClienteVO2>();
  Conexion conex= new Conexion();
    
  try {
   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM clientes where cedula_cliente = ? ");
   consulta.setString(1, nombre);
   ResultSet res = consulta.executeQuery();
   
  if(res.next()){
    CClienteVO2 cliente= new CClienteVO2();
    cliente.setcedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
    cliente.setdireccion_cliente(res.getString("direccion_cliente"));
    cliente.setemail_cliente(res.getString("email_cliente"));
    cliente.setnombre_cliente(res.getString("nombre_cliente"));
    cliente.settelefono_cliente(res.getString("telefono_cliente"));
 
    miCliente.add(cliente);
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
 * permite consultar la lista de Clientes
 * @return
 */
public ArrayList< CClienteVO2> listaDeclientes() {
  ArrayList< CClienteVO2> miCliente = new ArrayList< CClienteVO2>();
  Conexion conex= new Conexion();
    
  try {
   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM clientes");
   ResultSet res = consulta.executeQuery();
   while(res.next()){
    CClienteVO2 cliente= new CClienteVO2();
    cliente.setcedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
    cliente.setdireccion_cliente(res.getString("direccion_cliente"));
    cliente.setemail_cliente(res.getString("email_cliente"));
    cliente.setnombre_cliente(res.getString("nombre_cliente"));
    cliente.settelefono_cliente(res.getString("telefono_cliente"));
    System.out.println(""+res.getString("cedula_cliente")+","+res.getString("direccion_cliente")+" , "+res.getString("email_cliente")+"");

    miCliente.add(cliente);
          }
          res.close();
          consulta.close();
          conex.desconectar();
   
  } catch (Exception e) {
  
  }
  return miCliente;
 }

}