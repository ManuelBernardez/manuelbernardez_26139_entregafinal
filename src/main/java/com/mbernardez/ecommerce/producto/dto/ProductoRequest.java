package com.mbernardez.ecommerce.producto.dto;

import jakarta.validation.constraints.*;
import java.math.BigDecimal;

public record ProductoRequest(

        @NotBlank
        @Size(max = 100)
        String nombre,

        String descripcion,

        @NotNull
        @DecimalMin("0.0")
        BigDecimal precio,

        @NotNull
        @Min(0)
        Integer stock
) {}