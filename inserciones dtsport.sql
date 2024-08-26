Use datasport;
-- Insertar datos en la tabla centro_deportivo
INSERT INTO centro_deportivo (Id_Centro, Nombre, Direccion, Telefono, Email) VALUES 
(1, 'Centro Deportivo A', 'Calle 123, Ciudad A', '123456789', 'contacto@centrodeportivoa.com'),
(2, 'Centro Deportivo B', 'Avenida 456, Ciudad B', '987654321', 'info@centrodeportivob.com');

-- Insertar datos en la tabla Administrador
INSERT INTO Administrador (Cedula_Admin, Nombres, Apellidos, Direccion, Telefono, Email, Contraseña, Imagen, Rol, ID_Centro) VALUES 
(1092455777, 'Juan Andres', 'Perez gallego', 'Calle 789, Ciudad A', '111222333', 'juan@centrodeportivoa.com', 'pass1234', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761230/cld-sample-5.jpg', 'admin', 1),
(10824567423, 'Maria antonia', 'mendez angarita', 'Avenida 321, Ciudad B', '444555666', 'maria@centrodeportivob.com', 'pass5678','https://res.cloudinary.com/dlezql4zq/image/upload/v1723761230/cld-sample-3.jpg', 'admin',  2);

-- Insertar datos en la tabla Empleado
INSERT INTO Empleado (Cedula_Empleado, Nombres, Apellidos, Direccion, Telefono, Email, Contraseña, Imagen, Rol, Id_Centro, Estado) VALUES 
(18463924, 'Ana de celi', 'Orrego Obviedo', 'Avenida 202, Ciudad B', '555666777', 'ana@centrodeportivob.com', 'pass121314', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761228/samples/man-portrait.jpg', 'employee', 2, 'Despedido'),
(41911177, 'Carlos Alberto', 'Arnago Orrego', 'Calle 101, Ciudad A', '222333444', 'carlos@centrodeportivoa.com', 'pass91011', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761220/samples/people/smiling-man.jpg', 'employee', 1, 'Funcionamiento');

-- Insertar datos en la tabla Usuario
INSERT INTO Usuario (Id_Usuario, Nombres, Apellidos, Email, Direccion, Telefono, Estado, Imagen, Id_Centro) VALUES 
(1, 'Pedro Alonso', 'Martinez Jimenez', 'pedro@correo.com', 'Calle 303, Ciudad A', '666777888', 'Inactivo', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761221/samples/animals/kitten-playing.gif',1),
(2, 'Lucia Maria', 'Sanchez Urrego', 'lucia@correo.com', 'Avenida 404, Ciudad B', '777888999',  'Activo', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761221/samples/imagecon-group.jpg',2),
(3, 'Fanny', 'Morales Martinez', 'fannyM@correo.com', 'calle 44, Ciudad c', '77363548', 'Reportado', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761221/samples/people/bicycle.jpg',1 );

-- Insertar datos en la tabla Producto
INSERT INTO Producto (Id_Producto, Nombre, Descripcion, Estado, Stock, Imagen, Precio, Id_Centro) VALUES 
(1, 'Balón de Fútbol', 'cuero sintético con un diámetro de 22 cm, compuesto por paneles cosidos. Tiene un peso de alrededor de 430 gramos y es de color blanco', 'En venta', 50, 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761219/samples/food/dessert.jpg', 25.00, 1),
(2, 'Raqueta de Tenis', 'fibra de carbono, mide entre 95 y 110 pulgadas cuadradas', 'Deshabilitado', 30, 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761219/samples/animals/reindeer.jpg',30000.00, 2);

-- Insertar datos en la tabla bienes
INSERT INTO bienes (Id_Bienes, Nombre, Descripcion, Imagen, Cantidad) 
VALUES 
(1, 'Caminadora', 'Caminadora eléctrica de alto rendimiento con múltiples niveles de velocidad', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761220/samples/people/smiling-man.jpg ', 7),
(2, 'Cuerdas', 'Cuerdas de batalla para entrenamiento funcional', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761220/samples/sheep.jpg', 5),
(3, 'Bicicletas estáticas', 'Bicicletas estáticas para entrenamiento cardiovascular', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761219/samples/animals/reindeer.jpg',10),
(4, 'Mancuernas Ajustables', 'Mancuernas ajustables con sistema de discos intercambiables','https://res.cloudinary.com/dlezql4zq/image/upload/v1723761219/samples/ecommerce/analog-classic.jpg', 15);

-- Insertar datos en la tabla BienIndividual
INSERT INTO BienIndividual (Id_BienIndividual, Nombre, Descripcion, fecha_adquisición, Estado, Condicion, Imagen, Ultimo_mantenimiento, Siguiente_mantenimiento, Id_Bienes) 
VALUES 
(1, 'Caminadora' ,'Caminadora eléctrica de alto rendimiento con múltiples niveles de velocidad', '2023-06-20', 'Activo', 'Nuevo', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761220/samples/people/smiling-man.jpg ', '2023-07-20', '2024-08-09', 1),
(2,'Cuerdas', 'Cuerdas de batalla para entrenamiento funcional', '2022-12-02', 'Activo', 'Bien', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761220/samples/sheep.jpg', '2023-05-04', '2024-09-06', 2 ),
(3, 'Bicicletas estáticas', 'Bicicletas estáticas para entrenamiento cardiovascular', '2021-10-28', 'Inactivo', 'Dañado', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761219/samples/animals/reindeer.jpg', '2022-07-30', '2023-12-12', 3),
(4, 'Mancuernas Ajustables', 'Mancuernas ajustables con sistema de discos intercambiables', '2024-09-09', 'Inactivo', 'Usado', 'https://res.cloudinary.com/dlezql4zq/image/upload/v1723761219/samples/ecommerce/analog-classic.jpg' '2005-09-27', '2010-09-16',4 );

-- Insertar datos en la tabla PAGO
INSERT INTO PAGO (Monto, Fecha, Id_Usuario) VALUES 
(50.00, '2024-01-15', 1),
(75.00, '2024-02-15', 2),
(100.00, '2024-03-15', 3),
(125.00, '2024-04-15', 4);

-- Insertar datos en la tabla HISTORIAL_PAGO
INSERT INTO HISTORIAL_PAGO (Id_Usuario, ID_Pago) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insertar datos en la tabla VENTA
INSERT INTO VENTA (Fecha, ID_Producto, Id_Usuario) VALUES 
('2024-01-20', 1, 1),
('2024-02-20', 2, 2),
('2024-03-20', 3, 3),
('2024-04-20', 4, 4);

-- Insertar datos en la tabla INVENTARIO
INSERT INTO INVENTARIO (Nombre, Cantidad, Estado, Id_Centro) VALUES 
('Balón de Baloncesto', 40, 'Disponible', 1),
('Cinta de Correr', 5, 'Disponible', 2),
('Mancuernas', 25, 'Disponible', 1),
('Elíptica', 8, 'Disponible', 2);

set sql_safe_updates = 0;
delete from empleado;
set sql_safe_updates = 1;

SELECT * FROM bienes;