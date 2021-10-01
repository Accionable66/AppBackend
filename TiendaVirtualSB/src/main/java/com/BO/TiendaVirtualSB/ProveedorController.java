package com.BO.TiendaVirtualSB;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.boot.json.GsonJsonParser;
import org.springframework.boot.json.JsonParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.DAO.TiendaVirtualSB.ProveedorDAO;
import com.DTO.TiendaVirtualSB.ProveedorVO;
import com.fasterxml.jackson.databind.JsonNode;

@RestController
public class ProveedorController {

	@RequestMapping("/registrarProveedor")
	public void registrarProveedor(ProveedorVO proveedor) 
	 {
		ProveedorDAO Dao=new ProveedorDAO(); 
	    Dao.registrarProveedor(proveedor);
	    
	 }
	
	@RequestMapping("/modificarProveedor")
	public void modificarProveedor(ProveedorVO proveedor) 
	 {
		ProveedorDAO Dao=new ProveedorDAO(); 
	    Dao.modificarProveedor(proveedor);
	    
	 }
	
	@RequestMapping("/eliminaProveedor")
	public void eliminarProveedor(ProveedorVO proveedor) 
	 {
		ProveedorDAO Dao=new ProveedorDAO(); 
	    Dao.eliminarProveedor(proveedor);
	    
	 }
	   
	 
	 
	/**
	 * permite consultar el Proveedor asociado al nit enviado
	 * como parametro 
	 * @param nit 
	 * @return
	 */
	
	@RequestMapping("/consultarProveedor")
	public boolean consultarProveedor(String nombre) {
		ProveedorDAO Dao=new ProveedorDAO(); 
	return 	Dao.consultarProveedor(nombre);
		
	}



	/**
	 * permite consultar la lista de Proveedores
	 * @return
	 */
	@RequestMapping("/listarProveedor")
	public ArrayList< ProveedorVO> listaDeProveedores() {
		ProveedorDAO Dao=new ProveedorDAO(); 
			
		return Dao.listaDeProveedores();
		
	}
	
	
}
