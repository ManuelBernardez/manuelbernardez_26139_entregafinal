package com.mbernardez.ecommerce.producto.controller;

import com.mbernardez.ecommerce.producto.dto.ProductoRequest;
import com.mbernardez.ecommerce.producto.dto.ProductoResponse;
import com.mbernardez.ecommerce.producto.dto.ProductoMapper;
import com.mbernardez.ecommerce.producto.service.ProductoService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/productos")
public class ProductoRestController {

    private final ProductoService productoService;

    public ProductoRestController(ProductoService productoService) {
        this.productoService = productoService;
    }

    @GetMapping("/listado")
    public List<ProductoResponse> listar() {
        return productoService.findAll()
                .stream()
                .map(ProductoMapper::toResponse)
                .toList();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductoResponse> obtenerPorId(@PathVariable Long id) {
        return ResponseEntity.ok(
                ProductoMapper.toResponse(productoService.findById(id)));
    }

    @PostMapping
    public ProductoResponse crear(@Valid @RequestBody ProductoRequest request) {
        return ProductoMapper.toResponse(
                productoService.save(ProductoMapper.toEntity(request))
        );
    }

    @PutMapping("/{id}")
    public ProductoResponse actualizar(@PathVariable Long id,
                                       @Valid @RequestBody ProductoRequest request) {

        return ProductoMapper.toResponse(
                productoService.update(id, ProductoMapper.toEntity(request)));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        productoService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}