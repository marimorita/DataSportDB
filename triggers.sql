use datasport;
DROP TRIGGER ActualizarStockProductoDespuesDeVenta;

-- ---------------Trigger para Actualizar el Stock de Productos después de una Venta---------------
DELIMITER //

CREATE TRIGGER ActualizarStockProductoDespuesDeVenta
AFTER INSERT ON Venta
FOR EACH ROW
BEGIN
    UPDATE Producto
    SET Stock = Stock - 1 
    WHERE Id_Producto = NEW.Id_Producto;
END//

-- ---------------Trigger para Actualizar la Fecha de Actualización en Empleado---------------
DELIMITER //
CREATE TRIGGER ActualizarFechaActualizacionEmpleado
BEFORE UPDATE ON Empleado
FOR EACH ROW
BEGIN
    SET NEW.Fecha_Actualizacion = NOW();
END //

-- ---------------Trigger para Validar la Condición de un Bien antes de Insertar en BienIndividual---------------
DELIMITER //
CREATE TRIGGER ValidarCondicionBien
BEFORE INSERT ON BienIndividual
FOR EACH ROW
BEGIN
    IF NEW.Condicion NOT IN ('Nuevo', 'Bien', 'Usado', 'Dañado') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Condición del bien no válida.';
    END IF;
END //

-- ---------------Trigger para actualizar Estado de Usuario al eliminar un registro---------------
DELIMITER //
CREATE TRIGGER ActualizarEstadoUsuarioDespuesDeEliminar
AFTER DELETE ON Usuario
FOR EACH ROW
BEGIN
    UPDATE Usuario
    SET Estado = 'Inactivo'
    WHERE Id_Usuario = OLD.Id_Usuario;
END //

-- ---------------Trigger para asegurar que la cantidad en Venta no sea negativa---------------
DELIMITER //
CREATE TRIGGER VerificarCantidadVenta
BEFORE INSERT ON Venta
FOR EACH ROW
BEGIN
    IF NEW.Cantidad < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad de venta no puede ser negativa.';
    END IF;
END//

-- ---------------Trigger para actualizar el historial de pagos al insertar un nuevo pago---------------
DELIMITER //
CREATE TRIGGER ActualizarHistorialPago
AFTER INSERT ON Pago
FOR EACH ROW
BEGIN
    INSERT INTO Historial_Pago (Id_Usuario, Id_Pago)
    VALUES (NEW.Id_Usuario, NEW.Id_Pago);
END //
DELIMITER ;