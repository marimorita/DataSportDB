USE DataSport;
SHOW TRIGGERS LIKE '';
DROP TRIGGER IF EXISTS ActualizarEstadoMembresia;

DELIMITER //
-- Trigger para actualizar la fecha de actualización en la tabla Usuario
CREATE TRIGGER ActualizarFechaUsuario
BEFORE UPDATE ON Usuario
FOR EACH ROW
BEGIN
    SET NEW.Fecha_Actualizacion = NOW();
END //

-- Trigger para actualizar el stock del producto después de cada venta
DELIMITER //
CREATE TRIGGER ActualizarStockProducto
AFTER INSERT ON VENTA
FOR EACH ROW
BEGIN
    UPDATE Producto
    SET Stock = Stock - NEW.Cantidad
    WHERE Id_Producto = NEW.ID_Producto;
END//

-- Trigger para verificar el stock antes de una venta
DELIMITER //
CREATE TRIGGER VerificarStockAntesVenta
BEFORE INSERT ON VENTA
FOR EACH ROW
BEGIN
    DECLARE StockActual INT;
    SELECT Stock INTO StockActual FROM Producto WHERE Id_Producto = NEW.ID_Producto;

    IF StockActual < NEW.Cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para la venta';
    END IF;
END //

-- Trigger para activar automáticamente la membresía de un usuario después de una venta
DELIMITER //
CREATE TRIGGER ActualizarEstadoMembresia
AFTER INSERT ON VENTA
FOR EACH ROW
BEGIN
    UPDATE Membresia
    SET tipo = 'ACTIVO', fecha_inicio = CURDATE(), fecha_fin = DATE_ADD(CURDATE(), INTERVAL 1 YEAR)
    WHERE Id_Usuario = NEW.Id_Usuario;
END //

-- Trigger para establecer la fecha de creación y actualización al insertar un nuevo administrador
DELIMITER //
CREATE TRIGGER EstablecerFechasAdmin
BEFORE INSERT ON Administrador
FOR EACH ROW
BEGIN
    SET NEW.Fecha_Creacion = NOW();
    SET NEW.Fecha_Actualizacion = NOW();
END //

-- Trigger para establecer la fecha de creación y actualización al insertar un nuevo empleado
DELIMITER //
CREATE TRIGGER EstablecerFechasEmpleado
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    SET NEW.Fecha_Creacion = NOW();
    SET NEW.Fecha_Actualizacion = NOW();
END //

-- Trigger para establecer la fecha de creación y actualización al insertar un nuevo centro deportivo
DELIMITER //
CREATE TRIGGER EstablecerFechasCreacionCentro
BEFORE INSERT ON centro_deportivo
FOR EACH ROW
BEGIN
    SET NEW.Fecha_Creacion = NOW();
    SET NEW.Fecha_Actualizacion = NOW();
END //