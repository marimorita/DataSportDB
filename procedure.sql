use datasport;

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
DROP PROCEDURE IF EXISTS GetProductsByCenterId;

-- --------------------------------------Procedimientos para la tabla usuarios-----------------------------------------
-- Procedimiento para registrar un nuevo usuario
DELIMITER $$
CREATE PROCEDURE RegisterUser (
    IN userId BIGINT,
    IN userFirstName VARCHAR(120),
    IN userLastName VARCHAR(50),
    IN userEmail VARCHAR(100),
    IN userAddress VARCHAR(100),
    IN userPhone VARCHAR(15),
    IN userState ENUM('Inactivo', 'Activo', 'Reportado'),
    IN userImage TEXT,
    IN centerId INT
)
BEGIN
    INSERT INTO Usuario (Id_Usuario, Nombres, Apellidos, Email, Direccion, Telefono, Estado, Imagen, Id_Centro)
    VALUES (userId, userFirstName, userLastName, userEmail, userAddress, userPhone, userState, userImage, centerId);
END$$

-- Procedimiento para obtener todos los usuarios
DELIMITER $$
CREATE PROCEDURE GetAllUsers ()
BEGIN
    SELECT * FROM Usuario;
END$$

-- Procedimiento para obtener un usuario por su ID
DELIMITER $$
CREATE PROCEDURE GetUserById (
    IN userId INT
)
BEGIN
    SELECT * FROM Usuario
    WHERE Id_Usuario = userId;
END$$

-- Procedimiento para actualizar la información de un usuario
DELIMITER $$
CREATE PROCEDURE UpdateUser (
	IN userId BIGINT,
    IN userFirstName VARCHAR(120),
    IN userLastName VARCHAR(50),
    IN userEmail VARCHAR(100),
    IN userAddress VARCHAR(100),
    IN userPhone VARCHAR(15),
    IN userState ENUM('Inactivo', 'Activo', 'Reportado'),
    IN userImage TEXT,
    IN centerId INT
)
BEGIN
    UPDATE Usuario
    SET Nombres = userFirstName, Apellidos = userLastName, Email = userEmail, 
        Direccion = userAddress, Telefono = userPhone, Estado = userState, 
        Imagen = userImage, Id_Centro = centerId
    WHERE Id_Usuario = userId;
END$$

-- Procedimiento para eliminar un usuario
DELIMITER $$
CREATE PROCEDURE DeleteUser (
    IN userId BIGINT
)
BEGIN
    DELETE FROM Usuario
    WHERE Id_Usuario = userId;
END$$


-- ------------------------------ Procedimientos para la tabla producto ------------------------------
-- Procedimiento para registrar un nuevo producto
DELIMITER $$
CREATE PROCEDURE RegisterProduct (
    IN productName VARCHAR(100),
    IN productDescription TEXT,
    IN productState ENUM('En venta', 'Deshabilitado'),
    IN productStock INT,
    IN productImage TEXT,
    IN productPrice DECIMAL(10, 2),
    IN productCenterId INT
)
BEGIN
    INSERT INTO Producto (Nombre, Descripcion, Estado, Stock, Imagen, Precio, Id_Centro)
    VALUES (productName, productDescription, productState, productStock, productImage, productPrice, productCenterId);
END$$

-- Procedimiento para obtener todos los productos
DELIMITER $$
CREATE PROCEDURE GetAllProducts ()
BEGIN
    SELECT * FROM Producto;
END$$

-- Procedimiento para obtener un producto por su ID
DELIMITER $$
CREATE PROCEDURE GetProductById (
    IN productId INT
)
BEGIN
    SELECT * FROM Producto
    WHERE Id_Producto = productId;
END$$

-- Procedimiento para actualizar la información de un producto
DELIMITER $$
CREATE PROCEDURE UpdateProduct (
    IN productId INT,
    IN productName VARCHAR(100),
    IN productDescription TEXT,
    IN productState ENUM('En venta', 'Deshabilitado'),
    IN productStock INT,
    IN productImage TEXT,
    IN productPrice DECIMAL(10, 2),
    IN productCenterId INT
)
BEGIN
    UPDATE Producto
    SET Nombre = productName, Descripcion = productDescription, Estado = productState, 
        Stock = productStock, Imagen = productImage, Precio = productPrice, Id_Centro = productCenterId
    WHERE Id_Producto = productId;
END$$

-- Procedimiento para eliminar un producto
DELIMITER $$
CREATE PROCEDURE DeleteProduct (
    IN productId INT
)
BEGIN
    DELETE FROM Producto
    WHERE Id_Producto = productId;
END$$

-- ------------------------------ Procedimiento para la tabala bienes ------------------------------
-- Procedimiento para registrar un bien 
DELIMITER $$
CREATE PROCEDURE RegisterBien (
	IN bienId INT,
    IN bienName VARCHAR(255),
    IN bienDescription TEXT,
    IN bienImage TEXT,
    IN bienQuantity BIGINT
    )
    BEGIN 
    INSERT INTO bienes (Id_Bienes, Nombre, Descripcion, Imagen, Cantidad)
    VALUES (bienId, bienName, bienDescription, bienImage, bienQuantity);
END $$

-- Procedimeinto para obtener todos los bienes
DELIMITER $$
CREATE PROCEDURE GetAllBienes ()
BEGIN
	Select * From bienes;
END $$

-- Procemiento para obtener bienes por ID
DELIMITER $$
CREATE PROCEDURE GetBienesById(
	IN bienId INT
)
BEGIN 
	Select * From bienes
    Where Id_Bienes = bienId;
END $$

-- Procedimiento para Actualizar un bien
DELIMITER $$
CREATE PROCEDURE UpdateBien (
    IN bienId INT,
    IN bienName VARCHAR(255),
    IN bienDescription TEXT,
    IN bienImage TEXT,
    IN bienQuantity BIGINT
)
begin
	Update bienes 
    SET Nombre = bienName, Descripcion = bienDescription, Imagen = bienImage, Cantidad = bienQuantity
    WHERE Id_Bienes = bienId;
END $$
 
 -- Procedmiento para eliminar un bien 
 DELIMITER $$
CREATE PROCEDURE  Deletebien(
	IN bienId Int
)
BEGIN 
	Delete from bienes 
   	Where Id_Bienes = bienId;
END $$


-- -------------------------------Procedimiento para la tabla bienIndividual ------------------------------
-- Procidemiento para registara un bien individual
DELIMITER $$
CREATE PROCEDURE RegisterBienIndividual(
    IN bienIndividualName VARCHAR(255),
    IN bienIndividualDescription TEXT,
    IN bienIndividualFechaAdquisicion DATE,
    IN bienIndividualEstado ENUM('Activo', 'Inactivo'),
    IN bienIndividualCondicion ENUM('Nuevo', 'Bien', 'Usado', 'Dañado'),
    IN bienIndividualImagen TEXT,
    IN bienIndividualUltimoMantenimiento DATE,
    IN bienIndividualSiguienteMantenimiento DATE,
    IN bienId INT
)
BEGIN
    INSERT INTO BienIndividual (Nombre, Descripcion, fecha_adquisición, Estado, Condicion, Imagen, Ultimo_mantenimiento, Siguiente_mantenimiento, Id_Bienes)
    VALUES (bienIndividualName, bienIndividualDescription, bienIndividualFechaAdquisicion, bienIndividualEstado, bienIndividualCondicion, bienIndividualImagen, bienIndividualUltimoMantenimiento, bienIndividualSiguienteMantenimiento, bienId);
END$$

-- Procedimiento para obtener todos los bienes individuales
DELIMITER $$
CREATE PROCEDURE GetAllBienesIndividuales()
BEGIN
		select * from BienIndividual;
END $$

-- Procedimiento para obtener bien individual por id
DELIMITER $$
CREATE PROCEDURE GetBienIndividualById(
	IN bienIndividualId int
)
BEGIN
	select * from BienIndividual
    Where Id_BienIndividual = bienIndividualId;
END $$

-- Procedimiento para actualizar bien individual 
DELIMITER $$
CREATE PROCEDURE updateBienIndividual (
    IN bienIndividualId INT,
    IN bienIndividualName VARCHAR(255),
    IN bienIndividualDescription TEXT,
    IN bienIndividualFechaAdquisicion DATE,
    IN bienIndividualEstado ENUM('Activo', 'Inactivo'),
    IN bienIndividualCondicion ENUM('Nuevo', 'Bien', 'Usado', 'Dañado'),
    IN bienIndividualImagen TEXT,
    IN bienIndividualUltimoMantenimiento DATE,
    IN bienIndividualSiguienteMantenimiento DATE,
    IN bienId INT
)
BEGIN
    UPDATE BienIndividual
    SET Nombre = bienIndividualName, 
        Descripcion = bienIndividualDescription,
        fecha_adquisición = bienIndividualFechaAdquisicion,
        Estado = bienIndividualEstado,
        Condicion = bienIndividualCondicion,
        Imagen = bienIndividualImagen,
        Ultimo_mantenimiento = bienIndividualUltimoMantenimiento,
        Siguiente_mantenimiento = bienIndividualSiguienteMantenimiento,
        Id_Bienes = bienId
  WHERE Id_BienIndividual = bienIndividualId;
END$$

-- Procedimiento para eliminar un bien individual 
DELIMITER $$
CREATE PROCEDURE deleteBienIndividual (
    IN bienIndividualId INT
)
BEGIN 	
	delete from BienIndividual
	WHERE Id_BienIndividual = bienIndividualId;
END $$


-- -------------------------------Procedimientos para la tabla centro deportivo-------------------------------
-- Procedimiento para registar un centro deportivo 
DELIMITER $$
CREATE PROCEDURE RegisterCentroDeportivo (
	IN idCentro INT,
    IN nombreCentro VARCHAR(255),
    IN direccionCentro VARCHAR(255),
    IN telefonoCentro VARCHAR(50),
    IN emailCentro VARCHAR (150)
)
begin
	insert into centro_deportivo (Id_Centro, Nombre, Direccion, Telefono, Email) 
    values (idCentro, nombreCentro, direccionCentro, telefonoCentro, emailCentro);
END $$

-- Procedimiento para actualizar informacion del centro deportivo 
CREATE PROCEDURE UpdateCentroDeportivo(
    IN idCentro INT,
    IN nombreCentro VARCHAR(255),
    IN direccionCentro VARCHAR(255),
    IN telefonoCentro VARCHAR(50)
)
begin
	update centro_deportivo
    Set    nombre = nombreCentro,
		   direccion = direccionCentro,
		   telefono = telefonoCentro
	where  Id_Centro = idCentro;
END $$

-- Procedimiento para eliminar un centro deportivo 
CREATE PROCEDURE deleteCentroDeportivo(
	    IN idCentro INT
)
begin 
	delete from centro_deportivo
    where Id_Centro = idCentro;
END $$

-- Procedimiento para obtener informacion de todos los centros 
CREATE PROCEDURE GetAllCentrosDeportivos ()
begin 
	select * from centro_deportivo;
END $$

-- Procedimiento para obtener informacion por su id
CREATE PROCEDURE GetCentroDeportivoById(
    IN idCentro INT
) 
begin 
	select * from centro_deportivo
    where Id_Centro =  idCentro;
END $$

-- --------------------------------------------Procedimientos para la tabla pago--------------------------------------
-- Procedimiento para registrar un nuevo pago
CREATE PROCEDURE RegisterPago (
    IN userId BIGINT,           
    IN montoPago DECIMAL(10, 2),
    IN fechaPago DATE
)
BEGIN
    INSERT INTO Pago (Id_Usuario, Monto, Fecha)
    VALUES (userId, montoPago, fechaPago);  
END$$

-- Procedimiento para actualizar pago 
CREATE PROCEDURE UpdatePago (
    IN pagoId INT,         
    IN montoPago DECIMAL(10, 2),
    IN fechaPago DATE
)
BEGIN
	Update Pago 
	set monto = montoPago,
		Fecha = fechaPago
	where  Id_Pago = pagoId;
END $$

-- Procedimiento para eliminar un pago 
CREATE PROCEDURE DeletePago (   
	IN pagoId INT
)
begin 
	delete from pago
    where  Id_Pago = pagoId;
END $$

-- Procedimiento para obtener todos los pagos 
CREATE PROCEDURE GetAllPagos ()
BEGIN
    SELECT * FROM pago;
END$$


-- ----------------------------------------Procedimientos para la tabla Venta-----------------------------------------
-- Procedimiento para un nuevo registro
CREATE PROCEDURE RegisterVenta (
    IN fechaVenta DATE,
    IN productId INT,
    IN userId BIGINT
)
begin 
	insert into Venta (Fecha, Id_Producto, Id_Usuario)
    values (fechaVenta, productId, userId);
END $$

-- Procedimiento para obtener todas las ventas
CREATE PROCEDURE GetAllVentas()
begin
	select * from Venta;
END $$

-- Procedimiento para obtener venta por id de usuario 
CREATE PROCEDURE GetVentaUsuarioById(
    IN userId BIGINT
)
BEGIN 
	select * from Venta
    Where Id_Usuario = userId;
END $$ 

-- Procediemiento para obtener venta por id de producto 
CREATE PROCEDURE GetVentaProductoById(   
	IN productId INT
)
begin 
	select * from Venta
    where Id_Producto = productId;
END $$

-- Procedimiento para eliminar una venta 
CREATE PROCEDURE DeleteVenta(
	IN ventaId int
) 
begin 
	delete from Venta
    where Id_Venta = ventaId;
END $$

DELIMITER ;