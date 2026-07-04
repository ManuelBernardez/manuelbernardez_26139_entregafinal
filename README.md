# Ecommerce

Sistema backend desarrollado con Spring Boot y persistencia en MySQL, gestiona productos aplicando reglas de negocio. Realizado en el marco del curso Backend Java, Talento Tech.

Este proyecto está construido de forma incremental para simular un sistema real de ecommerce: desde un CRUD básico hasta una arquitectura full stack moderna con autenticación, carrito, sistema de pedidos y pasarela de pagos.


## Funcionalidades principales
- CRUD y listado de productos
- Arquitectura en capas (Controller / Service / Repository)
- Integración con MySQL mediante Spring Data JPA
- Manejo global de excepciones (@ControllerAdvice)
- Validaciones de inputs para garantizar integridad de datos
- Implementación de DTOs y Mappers para desacoplar la capa de dominio, evitando la exposición directa de entidades JPA y mejorando la separación de responsabilidades entre capas.


## Evolución del proyecto
- Introducción de relaciones entre entidades:
   - Relación muchos a muchos entre productos y categorías
- Gestión de categorías
- Creación de clientes asociados a usuarios
- Sistema de pedidos (carrito y compra)
- Detalle de pedidos con múltiples productos


## Tecnologías usadas

|   Categoría   |     Tecnología    |
|---------------|-------------------|
| Lenguaje      | Java 21           |
| Base de datos | MySQL 8           |
| Framework     | Spring Boot 3.5   |
| Persistencia  | Spring Data JPA   |
| Validaciones  | Bean Validation   |
| Utilidades    | Lombok            |


## Estructura del proyecto

```
com.mbernardez.ecommerce
│
├── producto
│   ├── controller/
│   ├── dto/
│   ├── service/
│   ├── repository/
│   └── Producto.java
│
├── exception
│
├── EcommerceApplication.java
```

## ⚙️ Cómo ejecutar el proyecto

### Requisitos previos

- Java 17+
- MySQL 8+
- Maven 3.8+

### Configuración

1. Crear la base de datos:
      Ejecutar el script `ecommerce_db.sql`

2. Configurar `src/main/resources/application.properties` con tus datos:
   ```properties
   spring.datasource.url= DB_URL
   spring.datasource.username= DB_USERNAME
   spring.datasource.password= DB_PASSWORD
   spring.jpa.hibernate.ddl-auto=update
   ```
3. Ejecutar:
   ```bash
   mvn spring-boot:run
   ```

## Endpoints actuales

| Método | Endpoint            | Descripción              |
|--------|----------------------|---------------------------|
| GET    | `/productos/listado` | Lista todos los productos |
| GET    | `/productos/{id}`    | Detalle de un producto    |
| POST   | `/productos`         | Crea un producto          |
| PUT    | `/productos/{id}`    | Actualiza un producto     |
| DELETE | `/productos/{id}`    | Elimina un producto       |


## Futuras mejoras
- Autenticación con Spring Security + JWT
- Sistema de roles (admin / cliente)
- Paginación y filtros avanzados
- Documentación con Swagger/OpenAPI

## Autor

Manuel Bernardez