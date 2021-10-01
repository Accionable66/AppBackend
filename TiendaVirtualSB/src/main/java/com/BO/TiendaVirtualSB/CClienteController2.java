package com.BO.TiendaVirtualSB;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.boot.json.GsonJsonParser;
import org.springframework.boot.json.JsonParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.DAO.TiendaVirtualSB.ClienteDAO;
import com.DTO.TiendaVirtualSB.ClienteVO;
import com.DAO.TiendaVirtualSB.CClienteDAO2;
import com.DAO.TiendaVirtualSB.ProveedorDAO;
import com.DTO.TiendaVirtualSB.CClienteVO2;
import com.DTO.TiendaVirtualSB.ProveedorVO;
import com.fasterxml.jackson.databind.JsonNode;



@RestController
public class CClienteController2 {
	
	/**
	 * Permite registrar un cliente nuevo
	 * @param cliente
	 */
	@RequestMapping("/registrarcliente")
	public void registrarcliente(CClienteVO2 cliente) 
	 {
		CClienteDAO2 Dao=new CClienteDAO2(); 
	    Dao.registrarcliente(cliente);
	    
	 }
	/**
	 * Permite actualizar un cliente
	 * @param cliente
	 */
	@RequestMapping("/modificarcliente")
	public void modificarcliente(CClienteVO2 cliente) 
	 {
		CClienteDAO2 Dao=new CClienteDAO2(); 
	    Dao.modificarcliente(cliente);
	    
	 }
	/**
	 * Permite eliminar un cliente
	 * @param cliente
	 */
	@RequestMapping("/eliminacliente")
	public void eliminarcliente(CClienteVO2 cliente) 
	 {
		CClienteDAO2 Dao=new CClienteDAO2(); 
	    Dao.eliminarcliente(cliente);
	    
	 }
	   
	 
	 
	/**
	 * permite consultar el Cliente asociado al documento enviado
	 * como parametro 
	 * @param documento 
	 * @return
	 */
	
	@RequestMapping("/consultarcliente")
	public boolean consultarcliente(String nombre) {
		CClienteDAO2 Dao=new CClienteDAO2(); 
	return 	Dao.consultarcliente(nombre);
		
	}



	/**
	 * permite consultar la lista de Clientes
	 * @return
	 */
	@RequestMapping("/listarclientes")
	public ArrayList< CClienteVO2> listaDeclientes() {
		CClienteDAO2 Dao=new CClienteDAO2(); 
			
		return Dao.listaDeclientes();
		
	}
	
		


}