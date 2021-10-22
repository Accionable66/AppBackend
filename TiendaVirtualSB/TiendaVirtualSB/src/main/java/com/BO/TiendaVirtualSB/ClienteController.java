package com.BO.TiendaVirtualSB;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.boot.json.GsonJsonParser;
import org.springframework.boot.json.JsonParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.DAO.TiendaVirtualSB.ClienteDAO;
import com.DTO.TiendaVirtualSB.CClienteVO2;
import com.DTO.TiendaVirtualSB.ClienteVO;
import com.DTO.TiendaVirtualSB.Informe;
import com.DTO.TiendaVirtualSB.ProveedorVO;
import com.DTO.TiendaVirtualSB.detalleVentasVO;
import com.DTO.TiendaVirtualSB.productos;
import com.DTO.TiendaVirtualSB.productosVO;
import com.DTO.TiendaVirtualSB.ventasVO;
import com.fasterxml.jackson.databind.JsonNode;



@RestController
public class ClienteController {
	
	
	@RequestMapping("/registrarPersona")
	public void registrarPersona(ClienteVO persona) 
	 {
		ClienteDAO Dao=new ClienteDAO(); 
	    Dao.registrarPersona(persona);
	    
	 }
	
	@RequestMapping("/modificarPersona")
	public void modificarPersona(ClienteVO persona) 
	 {
		ClienteDAO Dao=new ClienteDAO(); 
	    Dao.modificarPersona(persona);
	    
	 }
	
	@RequestMapping("/eliminaPersona")
	public void eliminarPersona(ClienteVO persona) 
	 {
		ClienteDAO Dao=new ClienteDAO(); 
	    Dao.eliminarPersona(persona);
	    
	 }
	   
	 
	 
	/**
	 * permite consultar el Cliente asociado al documento enviado
	 * como parametro 
	 * @param documento 
	 * @return
	 */
	
	@RequestMapping("/consultarPersona")
	public boolean consultarPersona(Integer cedula) {
		ClienteDAO Dao=new ClienteDAO(); 
	return 	Dao.consultarPersona(cedula);
		
	}



	/**
	 * permite consultar la lista de Clientes
	 * @return
	 */
	@RequestMapping("/listarPersonas")
	public ArrayList< ClienteVO> listaDePersonas() {
		ClienteDAO Dao=new ClienteDAO(); 
			
		return Dao.listaDePersonas();
		
	}
	
	
	/**
	 * permite consultar la lista de Clientes
	 * @return
	 */
	@RequestMapping("/listaLogin")
	public boolean loginDePersonas(String usuario, String password) {
		ClienteDAO Dao=new ClienteDAO(); 
		
			
		return Dao.loginDePersonas(usuario,password);
		
		
	}
	
	/**
	 * permite consultar la lista de Clientes
	 * @return
	 */
	@RequestMapping("/listarPersonas1")
	public ClienteVO listaDePersonas1(int cedula) {
		ClienteDAO Dao=new ClienteDAO(); 
			
		return Dao.listaDePersonas1(cedula);
		
	}
	
	@RequestMapping("/registrarProveedor")
	public void registrarProveedor(ProveedorVO proveedor) 
	 {
		ClienteDAO Dao=new ClienteDAO(); 
	    Dao.registrarProveedor(proveedor);
	    
	 }
	
	@RequestMapping("/modificarProveedor")
	public void modificarProveedor(ProveedorVO proveedor) 
	 {
		ClienteDAO Dao=new ClienteDAO(); 
	    Dao.modificarProveedor(proveedor);
	    
	 }
	
	@RequestMapping("/eliminarProveedor")
	public void eliminarProveedor(ProveedorVO proveedor) 
	 {
		ClienteDAO Dao=new ClienteDAO(); 
	    Dao.eliminarProveedor(proveedor);
	    
	 }
	   
	 
	 
	/**
	 * permite consultar el Proveedor asociado al documento enviado
	 * como parametro 
	 * @param documento 
	 * @return
	 */
	
	@RequestMapping("/consultarProveedor")
	public boolean consultarProveedor(Integer nit) {
		ClienteDAO Dao=new ClienteDAO(); 
	return 	Dao.consultarProveedor(nit);
		
	}



	/**
	 * permite consultar la lista de Proveedores
	 * @return
	 */
	@RequestMapping("/listarProveedores")
	public ArrayList< ProveedorVO> listaDeProveedores(int nit) {
		ClienteDAO Dao=new ClienteDAO(); 
			
		return Dao.listaDeProveedores(nit);
		
	}
	
	

	
	/**
	 * permite consultar la lista de Proveedores
	 * @return
	 */
	@RequestMapping("/listarProveedores1")
	public ProveedorVO listaDeProveedores1(int nit) {
		ClienteDAO Dao=new ClienteDAO(); 
			
		return Dao.listaDeProveedores1(nit);
		
	}
	
	/**
	 * Permite registrar un cliente nuevo
	 * 
	 * @param cliente
	 */
	@RequestMapping("/registrarcliente")
	public void registrarcliente(CClienteVO2 cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.registrarcliente(cliente);

	}

	/**
	 * Permite actualizar un cliente
	 * 
	 * @param cliente
	 */
	@RequestMapping("/modificarcliente")
	public void modificarcliente(CClienteVO2 cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.modificarcliente(cliente);

	}

	/**
	 * Permite eliminar un cliente
	 * 
	 * @param cliente
	 */
	@RequestMapping("/eliminacliente")
	public void eliminarcliente(CClienteVO2 cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.eliminarcliente(cliente);

	}

	/**
	 * permite consultar el Cliente asociado al documento enviado
	 * como parametro 
	 * @param documento 
	 * @return
	 */

	@RequestMapping("/consultarcliente")
	public boolean consultarcliente(Integer cedula) {
		ClienteDAO Dao=new ClienteDAO(); 
	return 	Dao.consultarcliente(cedula);
		
	}
	/**
	 * permite consultar la lista de Clientes
	 * @return
	 
		
	}*/

	@RequestMapping("/listarclientes")
	public CClienteVO2 listaDeClientes1(int cedula) {
		ClienteDAO Dao=new ClienteDAO(); 
			
		return Dao.listaDeClientes1(cedula);
		
	}
	
	/**
	 * Permite registrar un producto nuevo
	 * 
	 * @param cliente
	 */
	@RequestMapping("/registrarproducto")
	public void registrarproducto(productosVO producto) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.registrarproducto(producto);

	}
	
	/**
	 * permite consultar producto
	 * @return
	 
		
	}*/
	
	
	
	/**
	 * permite consultar la lista de Productos
	 * @return
	 
		
	}*/

	@RequestMapping("/listarproductos")
	public productosVO listaDeProductos1(long codigo_producto) {
		ClienteDAO Dao=new ClienteDAO(); 
			
		return Dao.listaDeProductos1(codigo_producto);
		
	}
	
	/**
	 * Permite eliminar un producto
	 * 
	 * @param cliente
	 */
	@RequestMapping("/eliminarproducto")
	public void eliminarproducto(productosVO producto) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.eliminarproducto(producto);

	}
	
	/**
	 * Permite eliminar un producto
	 * 
	 * @param cliente
	 */
	@RequestMapping("/eliminarTodoproducto")
	public void eliminarTodoproducto(productosVO producto) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.eliminarTodoproducto(producto);

	}
	
	/**
	 * permite consultar la lista de Clientes totales
	 * @return
	 */
	@RequestMapping("/listarClientesTotal")
	public ArrayList< CClienteVO2> consultarClientesTotal() {
		ClienteDAO Dao=new ClienteDAO(); 
			
		return Dao.consultarClientesTotal();
		
	}
	

	/**
	 * permite consultar la lista de Ventas total
	 * @return
	 */
	@RequestMapping("/listarVentasTotal")
	public ArrayList< ventasVO> consultarVentasTotal() {
		ClienteDAO Dao=new ClienteDAO(); 
		
		return Dao.consultarVentasTotal();
		
	}
	
	/**
	 * permite consultar la lista de Ventas total
	 * @return
	 */
	@RequestMapping("/listarVentasTotal1")
	public ArrayList<Informe> consultarVentasTotal1() {
		ClienteDAO Dao=new ClienteDAO(); 
		
		return Dao.consultarVentasTotal1();
		
	}
	
	/**
	 * permite consultar la lista de Productoss
	 * @return
	 
		
	}*/

	@RequestMapping("/listarproductos2")
	public productos listaDeProductos2(long codigo_producto) {
		ClienteDAO Dao=new ClienteDAO(); 
			
		return Dao.listaDeProductos2(codigo_producto);
		
	}
	

	/**
	 * permite consultar producto
	 * @return
	 
		
	}*/
	
	@RequestMapping("/consultarProducto")
	public boolean consultarProducto(Long codigo_producto) {
		ClienteDAO Dao=new ClienteDAO(); 
	return 	Dao.consultarProducto(codigo_producto);
		
	}
	/**
	 * Permite registrar un venta nuevo
	 * 
	 * @param venta
	 */
	@RequestMapping("/registrarVenta")
	public void registrarVenta(ventasVO venta) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.registrarVenta(venta);

	}
	
	/**
	 * Permite registrar un venta nuevo
	 * 
	 * @param venta
	 */
	@RequestMapping("/registrarDETALLEVenta")
	public void registrarDETALLEVenta(detalleVentasVO detalleventa)  {
		ClienteDAO Dao = new ClienteDAO();
		Dao.registrarDETALLEVenta(detalleventa);

	}
	
}