USE Supermercado;

--CURSOR DINAMICO
-- Declarar variables
DECLARE @ID_Producto INT;
DECLARE @Nombre_Producto VARCHAR(50);
DECLARE @ExistenciaAnterior INT;
DECLARE @ExistenciaNueva INT;
DECLARE @ProductoID INT = '4'; -- ID del producto que deseas actualizar

-- Declarar el cursor
DECLARE ProductosCursor CURSOR FOR
SELECT ID_Producto, Nombre_Producto, Existencia
FROM Productos
WHERE ID_Producto = @ProductoID; -- Filtrar por el ID_Producto deseado

-- Abrir el cursor
OPEN ProductosCursor;

-- Inicializar la lectura de filas
FETCH NEXT FROM ProductosCursor INTO @ID_Producto, @Nombre_Producto, @ExistenciaAnterior;

-- Recorrer el cursor, realizar la actualización y mostrar los cambios
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Realizar un cambio en la tabla Productos (por ejemplo, disminuir la existencia en 1)
    UPDATE Productos
    SET Existencia = Existencia - 1
    WHERE ID_Producto = @ID_Producto;
    
    -- Obtener la nueva existencia después de la actualización
    SELECT @ExistenciaNueva = Existencia
    FROM Productos
    WHERE ID_Producto = @ID_Producto;
    
    -- Mostrar los detalles antes y después de la actualización
    PRINT 'Producto: ' + @Nombre_Producto;
    PRINT 'Existencia Anterior: ' + CAST(@ExistenciaAnterior AS VARCHAR(10));
    PRINT 'Existencia Nueva: ' + CAST(@ExistenciaNueva AS VARCHAR(10));
    
    -- Obtener la siguiente fila (en este caso, habrá solo una fila)
    FETCH NEXT FROM ProductosCursor INTO @ID_Producto, @Nombre_Producto, @ExistenciaAnterior;
END;

-- Cerrar y liberar el cursor
CLOSE ProductosCursor;
DEALLOCATE ProductosCursor;

SELECT * FROM Productos;