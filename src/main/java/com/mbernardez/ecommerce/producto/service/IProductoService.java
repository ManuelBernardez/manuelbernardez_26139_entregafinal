package com.mbernardez.ecommerce.producto.service;

import com.mbernardez.ecommerce.producto.Producto;
import java.util.List;

public interface IProductoService {

    List<Producto> findAll();

    Producto findById(Long id);

    Producto save(Producto producto);

    Producto update(Long id, Producto producto);

    void deleteById(Long id);
}