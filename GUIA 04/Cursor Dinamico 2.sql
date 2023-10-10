USE Supermercado;

-- Declarar variables
DECLARE @ID_Producto INT;
DECLARE @Nombre_Producto VARCHAR(50);
DECLARE @ExistenciaAnterior INT;
DECLARE @ExistenciaNueva INT;
DECLARE @ProductoID INT; -- ID del producto que se desea actualizar
DECLARE @CantidadAAgregar INT; -- Cantidad que se desea agregar

-- Asignar valores a @ProductoID y @CantidadAAgregar
SET @ProductoID = '4'; 
SET @CantidadAAgregar = '2';

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
    -- Realizar el cambio en la tabla Productos (agregar la cantidad especificada)
    UPDATE Productos
    SET Existencia = Existencia + @CantidadAAgregar
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
