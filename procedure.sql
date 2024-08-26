use DataSport;

DROP PROCEDURE IF EXISTS RegisterUser;
DROP PROCEDURE IF EXISTS GetAllUsers;
DROP PROCEDURE IF EXISTS GetUserById;
DROP PROCEDURE IF EXISTS UpdateUser;
DROP PROCEDURE IF EXISTS DeleteUser;
DROP PROCEDURE IF EXISTS RegisterProduct;
DROP PROCEDURE IF EXISTS GetAllProducts;
DROP PROCEDURE IF EXISTS GetProductById;
DROP PROCEDURE IF EXISTS UpdateProduct;
DROP PROCEDURE IF EXISTS DeleteProduct;
DROP PROCEDURE IF EXISTS RegisterPayment;
DROP PROCEDURE IF EXISTS GetAllPayments;
DROP PROCEDURE IF EXISTS GetPaymentsByUserId;
DROP PROCEDURE IF EXISTS RegisterMembership;
DROP PROCEDURE IF EXISTS GetAllMemberships;
DROP PROCEDURE IF EXISTS GetMembershipByUserId;
DROP PROCEDURE IF EXISTS UpdateMembership;
DROP PROCEDURE IF EXISTS DeleteMembership;
DROP PROCEDURE IF EXISTS GetProductsByCenterId;
DROP PROCEDURE IF EXISTS GetMembershipsByUserId;


DELIMITER $$

-- Procedimiento para registrar un nuevo usuario
CREATE PROCEDURE RegisterUser (
    IN userName VARCHAR(255),
    IN userEmail VARCHAR(255),
    IN userPassword VARCHAR(255)
)
BEGIN
    INSERT INTO usuario (nombre, email, contraseña)
    VALUES (userName, userEmail, userPassword);
END$$

-- Procedimiento para obtener todos los usuarios
CREATE PROCEDURE GetAllUsers ()
BEGIN
    SELECT * FROM usuario;
END$$

-- Procedimiento para obtener un usuario por su ID
CREATE PROCEDURE GetUserById (
    IN userId INT
)
BEGIN
    SELECT * FROM usuario
    WHERE id_usuario = userId;
END$$

-- Procedimiento para actualizar la información de un usuario
CREATE PROCEDURE UpdateUser (
    IN userId INT,
    IN userName VARCHAR(255),
    IN userEmail VARCHAR(255),
    IN userPassword VARCHAR(255)
)
BEGIN
    UPDATE usuario
    SET nombre = userName, email = userEmail, contraseña = userPassword
    WHERE id_usuario = userId;
END$$

-- Procedimiento para eliminar un usuario
CREATE PROCEDURE DeleteUser (
    IN userId INT
)
BEGIN
    DELETE FROM usuario
    WHERE id_usuario = userId;
END$$

-- Procedimiento para registrar un nuevo producto
CREATE PROCEDURE RegisterProduct (
    IN productName VARCHAR(255),
    IN productQuantity INT,
    IN productPrice DECIMAL(10, 2)
)
BEGIN
    INSERT INTO producto (nombre, cantidad, precio)
    VALUES (productName, productQuantity, productPrice);
END$$

-- Procedimiento para obtener todos los productos
CREATE PROCEDURE GetAllProducts ()
BEGIN
    SELECT * FROM producto;
END$$

-- Procedimiento para obtener un producto por su ID
CREATE PROCEDURE GetProductById (
    IN productId INT
)
BEGIN
    SELECT * FROM producto
    WHERE id_producto = productId;
END$$

-- Procedimiento para actualizar la información de un producto
CREATE PROCEDURE UpdateProduct (
    IN productId INT,
    IN productName VARCHAR(255),
    IN productQuantity INT,
    IN productPrice DECIMAL(10, 2)
)
BEGIN
    UPDATE producto
    SET nombre = productName, cantidad = productQuantity, precio = productPrice
    WHERE id_producto = productId;
END$$

-- Procedimiento para eliminar un producto
CREATE PROCEDURE DeleteProduct (
    IN productId INT
)
BEGIN
    DELETE FROM producto
    WHERE id_producto = productId;
END$$

-- Procedimiento para registrar un nuevo pago
CREATE PROCEDURE RegisterPayment (
    IN userId INT,
    IN amount DECIMAL(10, 2),
    IN paymentDate DATE
)
BEGIN
    INSERT INTO pago (id_usuario, monto, fecha_pago)
    VALUES (userId, amount, paymentDate);
END$$

-- Procedimiento para obtener todos los pagos
CREATE PROCEDURE GetAllPayments ()
BEGIN
    SELECT * FROM pago;
END$$

-- Procedimiento para obtener pagos por ID de usuario
CREATE PROCEDURE GetPaymentsByUserId (
    IN userId INT
)
BEGIN
    SELECT * FROM pago
    WHERE id_usuario = userId;
END$$

-- Procedimiento para registrar una nueva membresía
CREATE PROCEDURE RegisterMembership (
    IN userId INT,
    IN membershipType VARCHAR(255),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    INSERT INTO membresia (id_usuario, tipo, fecha_inicio, fecha_fin)
    VALUES (userId, membershipType, startDate, endDate);
END$$

-- Procedimiento para obtener todas las membresías
CREATE PROCEDURE GetAllMemberships ()
BEGIN
    SELECT * FROM membresia;
END$$

-- Procedimiento para obtener membresías por ID de usuario
CREATE PROCEDURE GetMembershipByUserId (
    IN userId INT
)
BEGIN
    SELECT * FROM membresia
    WHERE id_usuario = userId;
END$$

-- Procedimiento para actualizar la información de una membresía
CREATE PROCEDURE UpdateMembership (
    IN membershipId INT,
    IN membershipType VARCHAR(255),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    UPDATE membresia
    SET tipo = membershipType, fecha_inicio = startDate, fecha_fin = endDate
    WHERE id_membresia = membershipId;
END$$

-- Procedimiento para eliminar una membresía
CREATE PROCEDURE DeleteMembership (
    IN membershipId INT
)
BEGIN
    DELETE FROM membresia
    WHERE id_membresia = membershipId;
END$$

-- Procedimiento para obtener productos por ID del centro
CREATE PROCEDURE GetProductsByCenterId (
    IN centerId INT
)
BEGIN
    SELECT * FROM producto
    WHERE id_centro = centerId;
END$$

-- Procedimiento para obtener membresías por ID de usuario
CREATE PROCEDURE GetMembershipsByUserId (
    IN userId INT
)
BEGIN
    SELECT * FROM membresia
    WHERE id_usuario = userId;
END$$

DELIMITER ;