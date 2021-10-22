package com.DTO.TiendaVirtualSB;

public class Informe {
	
	 
	 private Integer cedula_cliente;
	 private String nombre_cliente;
	 private Double total_venta;
	 private Double total_suma;
	 
	 
	 /**
	  * @return cedula_cliente
	  */
	 public Integer getcedula_cliente() {
	  return cedula_cliente;
	 }
	 
	 /**
	  * @param cedula_cliente to set
	  */
	 public void setcedula_cliente(Integer cedula_cliente) {
	  this.cedula_cliente = cedula_cliente;
	 }

	
	 /**
	  * @return the nombre_cliente
	  */
	 public String getnombre_cliente() {
	  return nombre_cliente;
	 }
	 
	 /**
	  * @param nombre_cliente to set
	  */
	 public void setnombre_cliente(String nombre_cliente) {
	  this.nombre_cliente = nombre_cliente;
	 }

	 /**
	  * @return the total_venta
	  */
	 public Double gettotal_venta() {
	  return total_venta;
	 }
	 
	 /**
	  * @param total_venta to set
	  */
	 public void settotal_venta(Double total_venta) {
	  this.total_venta = total_venta;
	 }
	 
	 /**
	  * @return the total_suma
	  */
	 public Double gettotal_suma() {
	  return total_suma;
	 }
	 
	 /**
	  * @param total_venta to set
	  */
	 public void settotal_suma(Double total_suma) {
	  this.total_venta = total_suma;
	 }
}

