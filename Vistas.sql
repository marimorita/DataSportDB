use datasport;
DROP VIEW IF EXISTS Vista_PagosYVentasPorUsuario;

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

-- ---------------------------------------------------------------------------------------------------------
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
    
-- ---------------------------------------------------------------------------------------------------------
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

-- ---------------------------------------------------------------------------------------------------------
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
    
    
-- ---------------------------------------------------------------------------------------------------------
CREATE VIEW Vista_ProductosStockBajo AS
SELECT 
    P.Nombre AS Nombre_Producto,
    P.Stock,
    CD.Nombre AS Nombre_Centro
FROM 
    Producto P
JOIN 
    centro_deportivo CD ON P.Id_Centro = CD.Id_Centro
WHERE 
    P.Stock < 10;  

-- ---------------------------------------------------------------------------------------------------------
CREATE VIEW Vista_BienesActivosYCcondicion AS
SELECT 
    BI.Id_BienIndividual,
    BI.Nombre,
    BI.Condicion,
    B.Nombre AS Nombre_BienGeneral
FROM
    BienIndividual BI
JOIN 
    bienes B ON BI.Id_Bienes = B.Id_Bienes
WHERE
    BI.Estado = 'Activo';

-- ---------------------------------------------------------------------------------------------------------
CREATE VIEW Vista_BienesPorCondicionYEstado AS
SELECT 
    B.Nombre AS Nombre_BienGeneral,
    BI.Condicion,
    BI.Estado,
    COUNT(BI.Id_BienIndividual) AS Cantidad
FROM 
    BienIndividual BI
JOIN 
    bienes B ON BI.Id_Bienes = B.Id_Bienes
GROUP BY 
    B.Nombre, BI.Condicion, BI.Estado;

-- ---------------------------------------------------------------------------------------------------------
CREATE VIEW Vista_PagosYVentasPorUsuario AS
SELECT 
    U.Nombres AS Nombre_Usuario,
    U.Apellidos,
    COALESCE(SUM(P.Monto), 0) AS Total_Pagos,
    COALESCE(COUNT(V.Id_Venta), 0) AS Total_Ventas
FROM 
    Usuario U
LEFT JOIN 
    Pago P ON U.Id_Usuario = P.Id_Usuario
LEFT JOIN 
    Venta V ON U.Id_Usuario = V.Id_Usuario
GROUP BY 
    U.Id_Usuario, U.Nombres, U.Apellidos;