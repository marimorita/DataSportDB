-- Pruebas unitarias
USE datasport;

SHOW TABLES;

-- Comprobar la estructura de las tablas
DESCRIBE centro_deportivo;
DESCRIBE Administrador;
DESCRIBE Empleado;
DESCRIBE Usuario;
DESCRIBE Producto;
DESCRIBE bienes;
DESCRIBE BienIndividual;
DESCRIBE Pago;
DESCRIBE Historial_Pago;
DESCRIBE Venta;

-- Comprobar las claves forÃ¡neas
SHOW CREATE TABLE centro_deportivo;
SHOW CREATE TABLE Administrador;
SHOW CREATE TABLE Empleado;
SHOW CREATE TABLE Usuario;
SHOW CREATE TABLE Producto;
SHOW CREATE TABLE bienes;
SHOW CREATE TABLE BienIndividual;
SHOW CREATE TABLE Pago;
SHOW CREATE TABLE Historial_Pago;
SHOW CREATE TABLE Venta;

-- Comprobar los datos insertados
SELECT * FROM centro_deportivo;
SELECT * FROM Administrador;
SELECT * FROM Empleado;
SELECT * FROM Usuario;
SELECT * FROM Producto;
SELECT * FROM bienes;
SELECT * FROM BienIndividual;
SELECT * FROM Pago;
SELECT * FROM Historial_Pago;
SELECT * FROM Venta;

-- Comprobar las vistas
SELECT * FROM Vista_ProductosVendidosPorCentro;
SELECT * FROM Vista_UsuariosActivos;
SELECT * FROM Vista_EmpleadosPorCentro;
SELECT * FROM Vista_HistorialPagosPorUsuario;
SELECT * FROM Vista_ProductosStockBajo;
SELECT * FROM Vista_BienesActivosYCcondicion;
SELECT * FROM Vista_BienesPorCondicionYEstado;
SELECT * FROM Vista_PagosYVentasPorUsuario;

-- Consultar el stock del producto después de la venta
SELECT Stock FROM Producto WHERE Nombre = 'Balón de Fútbol';

-- Actualizar el empleado
UPDATE Empleado 
SET Nombres = 'Empleado Modificado' 
WHERE Cedula_Empleado = 41911177;

-- Consultar la fecha de actualización del empleado
SELECT Fecha_Actualizacion FROM Empleado WHERE Cedula_Empleado = 18463924;

-- Consultar el estado del usuario después de eliminar
SELECT Estado FROM Usuario WHERE Id_Usuario = 2;

-- Intentar insertar una venta con una cantidad negativa
INSERT INTO Venta (Fecha, Id_Producto, Id_Usuario, Cantidad) 
VALUES (CURDATE(), (SELECT Id_Producto FROM Producto WHERE Nombre = 'Raqueta de Tenis'), 1, -1);
/*DEBE ARROJAR ERROR YA QUE NO SE PUEDEN INSERTAR DATOS NUMERICOS NEGATIVOSS*/

-- Intentar insertar un bien con una condición inválida
INSERT INTO BienIndividual (Nombre, Descripcion, fecha_adquisición, Estado, Condicion, Imagen, Ultimo_mantenimiento, Id_Bienes)
VALUES ('Cuerdas', 'Descripción Test', CURDATE(), 'Activo', 'Invalido', 'imagen.jpg', CURDATE(), 1);
/*ES UN BIEN QUE NO TIENE UNA CONDICION VALIDA, DEBE ARROJAR ERROR*/

-- Consultar el historial de pagos
SELECT * FROM Historial_Pago WHERE Id_Pago = (SELECT LAST_INSERT_ID());
-- Debería mostrar el registro insertado en `Historial_Pago` si el trigger funciona correctamente

-- Consultar la vista para verificar los resultados
SELECT * FROM Vista_ProductosVendidosPorCentro;
-- Debería mostrar los datos que coinciden con la inserción realizada

-- Consultar la vista para verificar los resultados
SELECT * FROM Vista_UsuariosActivos;
-- Debería mostrar solo 'Usuario Activo'

-- Consultar la vista para verificar los resultados
SELECT * FROM Vista_EmpleadosPorCentro;
-- Debería mostrar el empleado con la información correcta

-- Consultar la vista para verificar los resultados
SELECT * FROM Vista_HistorialPagosPorUsuario;
-- Debería mostrar el historial de pagos del 'Usuario Activo'

-- Consultar la vista para verificar los resultados
SELECT * FROM Vista_ProductosStockBajo;
-- Debería mostrar el 'Producto Bajo Stock'

-- Consultar la vista para verificar los resultados
SELECT * FROM Vista_PagosYVentasPorUsuario;
-- Debería mostrar el total de pagos y ventas del 'Usuario Activo'