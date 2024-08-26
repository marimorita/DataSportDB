-- Pruebas unitarias
USE DataSport;

SHOW TABLES;

-- Comprobar la estructura de las tablas
DESCRIBE centro_deportivo;
DESCRIBE administrador;
DESCRIBE empleado;
DESCRIBE usuario;
DESCRIBE producto;
DESCRIBE membresia;
DESCRIBE pago;
DESCRIBE historial_pago;
DESCRIBE venta;
DESCRIBE inventario;

-- Comprobar las claves forÃ¡neas
SHOW CREATE TABLE administrador;
SHOW CREATE TABLE empleado;
SHOW CREATE TABLE usuario;
SHOW CREATE TABLE producto;
SHOW CREATE TABLE membresia;
SHOW CREATE TABLE pago;
SHOW CREATE TABLE historial_pago;
SHOW CREATE TABLE venta;
SHOW CREATE TABLE inventario;

-- Comprobar los datos insertados
SELECT * FROM centro_deportivo;
SELECT * FROM administrador;
SELECT * FROM empleado;
SELECT * FROM usuario;
SELECT * FROM producto;
SELECT * FROM membresia;
SELECT * FROM pago;
SELECT * FROM historial_pago;
SELECT * FROM venta;
SELECT * FROM inventario;

-- Comprobar las vistas
SELECT * FROM vista_centros_administradores;
SELECT * FROM vista_centros_empleados;
SELECT * FROM vista_usuarios_membresias;
SELECT * FROM vista_productos_centros;
SELECT * FROM vista_pagos_usuarios;
SELECT * FROM vista_historial_pagos;
SELECT * FROM vista_ventas;
SELECT * FROM vista_inventario_centros;

-- Prueba del trigger ActualizarFechaUsuario
UPDATE usuario SET nombre = 'Pedro Actualizado' WHERE id_usuario = 1;
SELECT nombre, fecha_actualizacion FROM usuario WHERE id_usuario = 1;

-- Prueba del trigger ActualizarStockProducto y VerificarStockAntesVenta
INSERT INTO venta (fecha, id_producto, id_usuario, cantidad) VALUES ('2024-05-01', 1, 1, 2);
SELECT stock FROM producto WHERE id_producto = 1;

-- Prueba del trigger ActualizarEstadoMembresia
INSERT INTO venta (fecha, id_producto, id_usuario, cantidad) VALUES ('2024-06-01', 2, 2, 1);
SELECT tipo, fecha_inicio, fecha_fin FROM membresia WHERE id_usuario = 2;

-- Prueba del trigger EstablecerFechaCreacionAdmin y ActualizarFechaActualizacionAdmin
INSERT INTO administrador (nombre, direccion, telefono, email, contrasena, id_centro) VALUES ('Nuevo Admin', 'Calle 123', '123456789', 'nuevo@correo.com', 'password', 1);
SELECT fecha_creacion, fecha_actualizacion FROM administrador WHERE nombre = 'Nuevo Admin';
UPDATE administrador SET nombre = 'Admin Actualizado' WHERE nombre = 'Nuevo Admin';
SELECT fecha_creacion, fecha_actualizacion FROM administrador WHERE nombre = 'Admin Actualizado';

-- Prueba del trigger EstablecerFechaCreacionEmpleado y ActualizarFechaActualizacionEmpleado
INSERT INTO empleado (nombre, direccion, telefono, email, contrasena, id_centro) VALUES ('Nuevo Empleado', 'Calle 456', '987654321', 'empleado@correo.com', 'password', 1);
SELECT fecha_creacion, fecha_actualizacion FROM empleado WHERE nombre = 'Nuevo Empleado';
UPDATE empleado SET nombre = 'Empleado Actualizado' WHERE nombre = 'Nuevo Empleado';
SELECT fecha_creacion, fecha_actualizacion FROM empleado WHERE nombre = 'Empleado Actualizado';

-- Prueba de los procedimientos almacenados
CALL RegisterUser('John Doe', 'john.doe@example.com', 'password');
CALL GetAllUsers();
CALL GetUserById(1);
CALL UpdateUser(1, 'John Updated', 'john.updated@example.com', 'newpassword');
CALL DeleteUser(1);

CALL RegisterProduct('Product A', 10, 9.99);
CALL GetAllProducts();
CALL GetProductById(1);
CALL UpdateProduct(1, 'Product A Updated', 20, 19.99);
CALL DeleteProduct(1);

CALL RegisterPayment(1, 50.00, '2024-07-01');
CALL GetAllPayments();
CALL GetPaymentsByUserId(1);

CALL RegisterMembership(1, 'Premium', '2024-07-01', '2025-07-01');
CALL GetAllMemberships();
CALL GetMembershipByUserId(1);
CALL UpdateMembership(1, 'Standard', '2024-08-01', '2025-08-01');
CALL DeleteMembership(1);