package com.mbernardez.ecommerce.producto.service;

import com.mbernardez.ecommerce.producto.Producto;
import com.mbernardez.ecommerce.producto.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import com.mbernardez.ecommerce.exception.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductoService implements IProductoService {

    private final ProductoRepository productoRepository;

    @Autowired
    public ProductoService(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }

    @Override
    public List<Producto> findAll() {
        return productoRepository.findAll();
    }

    @Override
    public Producto findById(Long id) {
        return productoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Producto no encontrado"));
    }

    @Override
    public Producto save(Producto producto) {
        return productoRepository.save(producto);
    }

    @Override
    public Producto update(Long id, Producto producto) {

        Producto existing = productoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Producto no encontrado"));

        existing.setNombre(producto.getNombre());
        existing.setPrecio(producto.getPrecio());
        existing.setDescripcion(producto.getDescripcion());
        existing.setStock(producto.getStock());

        return productoRepository.save(existing);
    }

    @Override
    public void deleteById(Long id) {

        if (!productoRepository.existsById(id)) {
            throw new ResourceNotFoundException("Producto no encontrado");
        }

        productoRepository.deleteById(id);
    }
}