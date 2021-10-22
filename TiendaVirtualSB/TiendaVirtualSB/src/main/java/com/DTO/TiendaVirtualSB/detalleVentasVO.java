package com.DTO.TiendaVirtualSB;

public class detalleVentasVO {
	
	 private Long codigo_detalle_venta;
	 private Integer cantidad_producto;
	 private Long codigo_producto;
	 private Long codigo_venta;
	 private Double valor_total;
	 private Double valor_venta;
	 private Double valoriva;
	 
	 /**
	  * @return the codigo_detalle_venta
	  */
	 public Long getcodigo_detalle_venta() {
	  return codigo_detalle_venta;
	 }
	 
	 /**
	  * @param codigo_detalle_venta to set
	  */
	 public void setcodigo_detalle_venta (Long codigo_detalle_venta) {
	  this.codigo_detalle_venta = codigo_detalle_venta;
	 }

	 /**
	  * @return cantidad_producto
	  */
	 public Integer getcantidad_producto() {
	  return cantidad_producto;
	 }
	 
	 /**
	  * @param cantidad_producto to set
	  */
	 public void setcantidad_producto(Integer cantidad_producto) {
	  this.cantidad_producto = cantidad_producto;
	 }

	 /**
	  * @return the codigo_producto
	  */
	 public Long getcodigo_producto() {
	  return codigo_producto;
	 }
	 
	 /**
	  * @param codigo_producto to set
	  */
	 public void setcodigo_producto(Long codigo_producto) {
	  this.codigo_producto = codigo_producto;
	 }

	 /**
	  * @return the codigo_venta
	  */
	 public Long codigo_venta() {
	  return codigo_venta;
	 }
	 
	 /**
	  * @param codigo_venta to set
	  */
	 public void setcodigo_venta(Long codigo_venta) {
	  this.codigo_venta = codigo_venta;
	 }

	 /**
	  * @return the valor_total
	  */
	 public Double getvalor_total() {
	  return valor_total;
	 }
	 
	 /**
	  * @param valor_total to set
	  */
	 public void setvalor_total(Double valor_total) {
	  this.valor_total = valor_total;
	 }
	 
	 /**
	  * @return the valor_venta
	  */
	 public Double getvalor_venta() {
	  return valor_venta;
	 }
	 
	 /**
	  * @param valor_venta to set
	  */
	 public void setvalor_venta(Double valor_venta) {
	  this.valor_venta = valor_venta;
	 }	 
	 
	 /**
	  * @return the valoriva
	  */
	 public Double getvaloriva() {
	  return valoriva;
	 }
	 
	 /**
	  * @param valoriva to set
	  */
	 public void setvaloriva(Double valoriva) {
	  this.valoriva = valoriva;
	 }	 
}
