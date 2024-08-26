/*Base de datos principal (Tablas y alter table)
Responsables: Mariana y Andres*/
SELECT USER();
SELECT * FROM bienes;
SELECT * FROM Usuario WHERE Id_Usuario = 1;

CREATE DATABASE datasport;
DROP DATABASE IF EXISTS datasport;
drop table if exists bienes;
USE datasport;

CREATE TABLE centro_deportivo (
    Id_Centro INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Administrador (
    Cedula_Admin BIGINT PRIMARY KEY,
    Nombres VARCHAR(120) NOT NULL,
    Apellidos VARCHAR(120) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Contraseña VARCHAR(100),
    Imagen text,
    Rol varchar(10),
    Id_Centro INT,
    CONSTRAINT FK_Centro_Administrador FOREIGN KEY (Id_Centro) REFERENCES centro_deportivo (Id_Centro)
);

CREATE TABLE Empleado (
    Cedula_Empleado BIGINT PRIMARY KEY,
    Nombres VARCHAR(120) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Contraseña VARCHAR(100),
    Imagen text,
    Rol varchar(10),
    Id_Centro INT,
    Estado enum ('Funcionamiento' , 'Despedido')NOT NULL,
    CONSTRAINT FK_Centro_Empleado FOREIGN KEY (Id_Centro) REFERENCES centro_deportivo (Id_Centro)
);

CREATE TABLE Usuario (
    Id_Usuario BIGINT PRIMARY KEY,
    Nombres VARCHAR(120) not null, 
    Apellidos VARCHAR(50),
    Email VARCHAR(100),
    Direccion VARCHAR(100),
    Telefono VARCHAR(15),
    Estado enum ('Inactivo', 'Activo', 'Reportado')NOT NULL,
	Imagen text, 
	Id_Centro INT,
    CONSTRAINT FK_Centro_Usuario FOREIGN KEY (Id_Centro) REFERENCES centro_deportivo (Id_Centro)
);

CREATE TABLE Producto (
    Id_Producto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion text,
    Estado enum ('En venta', 'Deshabilitado')NOT NULL,
    Stock INT Not null,
    Imagen text,
    Precio DECIMAL,
    Id_Centro INT,
    CONSTRAINT FK_Centro_Producto FOREIGN KEY (Id_Centro) REFERENCES centro_deportivo (Id_Centro)
);

CREATE TABLE bienes (
    Id_Bienes INT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    Imagen text,
    Cantidad bigint NOT NULL
    );
    
CREATE TABLE BienIndividual (
    Id_BienIndividual INT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    fecha_adquisición DATE,
    Estado ENUM('Activo', 'Inactivo')NOT NULL,
    Condicion ENUM ('Nuevo', 'Bien', 'Usado', 'Dañado')NOT NULL,
    Imagen text,
    Ultimo_mantenimiento DATE,
    Siguiente_mantenimiento DATE, 
    Id_Bienes INT,
    CONSTRAINT FK_Bien_Individual FOREIGN KEY (Id_Bienes) REFERENCES bienes(Id_Bienes)
);

/*CREATE TABLE Membresia (
    Id_Membresia INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('ACTIVO', 'INACTIVO') NOT NULL,
    Id_Usuario INT,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    CONSTRAINT FK_Usuario_Membresia FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
);*/

CREATE TABLE Pago (
    Id_Pago INT PRIMARY KEY AUTO_INCREMENT,
    Monto DECIMAL(10, 2) NOT NULL,
    Fecha DATE NOT NULL,
    Id_Usuario bigint,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario (Id_Usuario)
);

CREATE TABLE Historial_Pago (
    Id_Historial INT PRIMARY KEY AUTO_INCREMENT,
    Id_Usuario bigint,
    Id_Pago INT,
	CONSTRAINT HISTORIAL_PAGO_ibfk_1 FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
);

CREATE TABLE Venta (
    Id_Venta INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Id_Producto INT,
    Id_Usuario bigint,
    FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto),
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario (Id_Usuario)
);

CREATE TABLE Inventario (
    Id_Inventario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Cantidad bigint,
    Estado ENUM('Disponible', 'Prestado', 'Extraviado'),
    Id_Centro INT,
    FOREIGN KEY (Id_Centro) REFERENCES centro_deportivo (Id_Centro)
);

ALTER TABLE bienes DROP COLUMN Cantidad;
ALTER TABLE Producto modify Precio decimal (10,2);
ALTER TABLE Usuario ADD COLUMN Fecha_Actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE VENTA ADD COLUMN Cantidad Int;
/*ALTER TABLE Membresia ADD COLUMN Fecha_Creacion DATE;
ALTER TABLE Membresia ADD COLUMN Fecha_Actualizacio DATE;*/
ALTER TABLE Administrador ADD COLUMN Fecha_Creacion DATE;
ALTER TABLE Administrador ADD COLUMN Fecha_Actualizacion DATE;
ALTER TABLE Empleado ADD COLUMN Fecha_Creacion DATE;
ALTER TABLE Empleado ADD COLUMN Fecha_Actualizacion DATE;
ALTER TABLE centro_deportivo ADD COLUMN Fecha_Creacion DATE;
ALTER TABLE centro_deportivo ADD COLUMN Fecha_Actualizacion DATE;
ALTER TABLE Producto ADD COLUMN Estado enum ('en venta', 'deshabilitado');   
ALTER TABLE Usuario ADD COLUMN Estado enum ('inactivo', 'activo', 'reportado');