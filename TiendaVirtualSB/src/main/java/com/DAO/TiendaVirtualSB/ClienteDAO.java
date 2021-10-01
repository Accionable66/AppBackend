package com.DAO.TiendaVirtualSB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import com.BO.TiendaVirtualSB.*;
import com.DTO.TiendaVirtualSB.ClienteVO;


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
}