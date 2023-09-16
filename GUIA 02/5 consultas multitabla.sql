USE Supermercado;

--Obtener el nombre de los empleados que tienen el cargo de "Gerente" y son del departamento de "Sonsonate"
SELECT E.Nombres, E.Apellidos, E.ID_Cargo, E.ID_Direccion
FROM Empleados E
JOIN Cargos AS C ON E.ID_Cargo = C.ID_Cargo
JOIN Direcciones AS D ON E.ID_Direccion = D.ID_Direccion
JOIN Distritos AS DI ON D.ID_Distrito = DI.ID_Distrito
JOIN Municipios AS M ON DI.ID_Municipio = M.ID_Municipio
JOIN Departamentos AS DEP ON M.ID_Departamento = DEP.ID_Departamento
WHERE C.Cargo = 'Gerente' AND DEP.Departamento = 'Sonsonate';

--Obtener la información de un pedido específico y sus productos
SELECT P.FechaPedido, P.Monto, Pro.Nombre_Producto, DP.Cantidad, Pro.Precio_Unitario
FROM Pedidos AS P
JOIN Detalle_Pedidos AS DP ON P.ID_Pedido = DP.ID_Pedido
JOIN Productos AS Pro ON DP.ID_Producto = Pro.ID_Producto
WHERE P.ID_Pedido = 4;

--Ver el monto total de los pedidos de los proveedores
SELECT A.Nombre_Proveedor AS NombreProveedor, 
       SUM(Productos.Precio_Unitario * Detalle_Pedidos.Cantidad) AS MontoTotalPedidos
FROM Proveedores AS A
JOIN Productos ON A.ID_Proveedor = Productos.ID_Producto
JOIN Detalle_Pedidos ON Productos.ID_Producto = Detalle_Pedidos.ID_Producto
GROUP BY A.Nombre_Proveedor;

-- ver el proveedor que contiene el producto con mayor precio unitario
SELECT Pro.Nombre_Proveedor, 
       P.Nombre_Producto, 
       P.Precio_Unitario
FROM Proveedores AS Pro
JOIN Productos AS P ON Pro.ID_Proveedor = P.ID_Producto
WHERE P.Precio_Unitario = (
    SELECT MAX(Precio_Unitario) FROM Productos WHERE ID_Proveedor = Pro.ID_Proveedor
);

-- conocer a los empleados y sus cargos
SELECT E.ID_Empleado, E.Nombres, E.Apellidos, C.Cargo
FROM Empleados AS E
JOIN Cargos AS C ON E.ID_Cargo = C.ID_Cargo;
