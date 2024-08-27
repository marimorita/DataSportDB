Use datasport;
-- Vista de Productos Vendidos por Centro Deportivo
CREATE VIEW Vista_ProductosVendidosPorCentro AS
SELECT 
    CD.Nombre AS Nombre_Centro,
    P.Nombre AS Nombre_Producto,
    U.Nombres AS Nombre_Usuario,
    V.Fecha
FROM 
    Venta V
JOIN 
    Producto P ON V.Id_Producto = P.Id_Producto
JOIN 
    Usuario U ON V.Id_Usuario = U.Id_Usuario
JOIN 
    centro_deportivo CD ON P.Id_Centro = CD.Id_Centro;

-- Vista de Usuarios Activos
CREATE VIEW Vista_UsuariosActivos AS 
SELECT
    U.Id_Usuario,
    U.Nombres,
    U.Apellidos,
    U.Email,
    U.Direccion,
    U.Telefono,
    CD.Nombre AS Nombre_Centro
FROM 
    Usuario U
JOIN 
    centro_deportivo CD ON U.Id_Centro = CD.Id_Centro
WHERE 
    U.Estado = 'Activo';

-- Vista de Empleados por Centro Deportivo
CREATE VIEW Vista_EmpleadosPorCentro AS
SELECT 
    E.Cedula_Empleado,
    E.Nombres,
    E.Apellidos,
    E.Rol,
    E.Estado,
    CD.Nombre AS Nombre_Centro
FROM 
    Empleado E
JOIN 
    centro_deportivo CD ON E.Id_Centro = CD.Id_Centro;

-- Vista de Historial de Pagos por Usuario
CREATE VIEW Vista_HistorialPagosPorUsuario AS
SELECT    
    U.Id_Usuario,
    U.Nombres,
    U.Apellidos,
    U.Email,
    U.Direccion,
    U.Telefono,
    CD.Nombre AS Nombre_Centro
FROM 
    Historial_Pago HP
JOIN
    Usuario U ON HP.Id_Usuario = U.Id_Usuario
JOIN 
    Pago P ON HP.Id_Pago = P.Id_Pago
JOIN 
    centro_deportivo CD ON U.Id_Centro = CD.Id_Centro;

-- Vista de Bienes Activos y su Condición
CREATE VIEW Vista_BienesActivosYCcondicion AS
SELECT 
    BI.Id_BienIndividual,
    BI.Nombre,
    BI.Condicion,
    B.Nombre AS Nombre_BienGeneral,
    CD.Nombre AS Nombre_Centro
FROM
    BienIndividual BI
JOIN 
    bienes B ON BI.Id_Bienes = B.Id_Bienes
JOIN
    centro_deportivo CD ON B.Id_Centro = CD.Id_Centro
WHERE
    BI.Estado = 'Activo';
