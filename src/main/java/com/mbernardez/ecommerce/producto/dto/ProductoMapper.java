package com.mbernardez.ecommerce.producto.dto;

import com.mbernardez.ecommerce.producto.Producto;

public class ProductoMapper {

    public static Producto toEntity(ProductoRequest request) {
        return new Producto(
                request.nombre(),
                request.precio(),
                request.descripcion(),
                request.stock()
        );
    }

    public static ProductoResponse toResponse(Producto producto) {
        return new ProductoResponse(
                producto.getId(),
                producto.getNombre(),
                producto.getDescripcion(),
                producto.getPrecio(),
                producto.getStock(),
                producto.getActivo()
        );
    }
}