USE Supermercado;

-- Crear la UDF escalar
CREATE FUNCTION dbo.CalcularEdad
(
    @FechaNacimiento DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @Edad INT
    
    -- Calcular la edad restando la fecha de nacimiento de la fecha actual
    SET @Edad = DATEDIFF(YEAR, @FechaNacimiento, GETDATE())
    
    RETURN @Edad
END


-- Uso de la UDF escalar
SELECT NombresEmpleado, ApellidosEmpleado, FechaNacEmpleado, dbo.CalcularEdad(FechaNacEmpleado) AS Edad
FROM Empleados


-- Crear la UDF con valores de tabla
CREATE FUNCTION dbo.ObtenerProductosPorPrecio
(
    @PrecioMax DECIMAL(10, 2)
)
RETURNS TABLE
AS
RETURN
(
    SELECT ID_Producto, Nombre_Producto, Precio_Unitario
    FROM Productos
    WHERE Precio_Unitario <= @PrecioMax
)

-- UDF con valores de tabla
SELECT *
FROM dbo.ObtenerProductosPorPrecio(3.00)




