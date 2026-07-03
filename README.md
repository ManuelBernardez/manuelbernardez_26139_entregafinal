# Ecommerce

Sistema backend desarrollado con Spring Boot y persistencia en MySQL, gestiona productos aplicando reglas de negocio. Realizado en el marco del curso Backend Java, Talento Tech.

Este proyecto está construido de forma incremental para simular un sistema real de ecommerce: desde un CRUD básico hasta una arquitectura full stack moderna con autenticación, carrito y sistema de pedidos.


- CRUD y listado de productos
- Arquitectura en capas (Controller / Service / Repository)
- Spring Boot + JPA + MySQL
- Modelo de datos básico para productos


## Tecnologías utilizadas

|   Categoría   |     Tecnología    |
|---------------|-------------------|
| Lenguaje      | Java 17+          |
| Framework     | Spring Boot       |
| Persistencia  | Spring Data JPA   |
| Base de datos | MySQL             |
| Utilidades    | Lombok            |


## Estructura del proyecto

```
com.mbernardez.ecommerce
│
├── producto
│   ├── controller/
│   ├── service/
│   ├── repository/
│   └── Producto.java
│
├── EcommerceApplication.java
```

## ⚙️ Cómo ejecutar el proyecto

### Requisitos previos

- Java 17+
- Maven 3.8+
- MySQL 8+

### Configuración

1. Crear la base de datos:
   ```sql
   CREATE DATABASE ecommerce;
   ```
2. Configurar `src/main/resources/application.properties`:
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
| GET    | `/productos`         | Lista todos los productos |
| GET    | `/productos/{id}`    | Detalle de un producto    |
| POST   | `/productos`         | Crea un producto          |
| PUT    | `/productos/{id}`    | Actualiza un producto     |
| DELETE | `/productos/{id}`    | Elimina un producto       |


## Autor

Manuel Bernardez