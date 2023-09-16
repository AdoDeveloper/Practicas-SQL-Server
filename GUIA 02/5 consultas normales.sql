use Supermercado;

--Consulta para conocer los productos con un precio unitario mayor a $3.00
SELECT *
FROM Productos
WHERE Precio_Unitario > 3;

--Consulta para obtener la cantidad total de productos en existencia en el supermercado
SELECT SUM(Existencia) AS Cantidad_Total
FROM Productos;

SELECT * FROM Productos;

--Consulta para calcular el precio total de una compra específica (ID_Venta) incluyendo el IVA (13%)
SELECT ID_Venta,MontoVenta, MontoVenta + (MontoVenta * 0.13) AS Precio_Total_Con_IVA
FROM Ventas
WHERE ID_Venta = 5; -- Reemplaza con el ID de la venta deseada

SELECT * FROM Ventas;

--Consulta para calcular la edad promedio de los empleados 
SELECT AVG(DATEDIFF(YEAR, FechaNac, GETDATE())) AS Edad_Promedio
FROM Empleados;

SELECT * FROM Empleados;

--Consulta para obtener los clientes cuyo número de teléfono contiene el dígito '1' 
--Y que nacieron antes o en el año 1990
SELECT Nombres, Apellidos, FechaNac, Telefono
FROM Clientes
WHERE Telefono LIKE '%1%' AND YEAR(FechaNac) <= 1990;

SELECT * FROM Clientes;