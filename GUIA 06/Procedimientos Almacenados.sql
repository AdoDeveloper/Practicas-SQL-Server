USE Super;

--De inserción: Debe agregar un registro nuevo a cualesquiera de las tablas de su base.
CREATE PROCEDURE AgregarClientes
-- Variables
	@Nombres varchar (50),
	@Apellidos varchar (50),
	@DUI varchar (10),
	@FechaNac date,
	@Telefono varchar(10),
	@Email varchar (30),
	@ID_Direccion int
AS
BEGIN
	INSERT INTO Clientes VALUES
	(
	@Nombres ,
	@Apellidos,
	@DUI,
	@FechaNac,
	@Telefono,
	@Email,
	@ID_Direccion
	);

	SELECT * FROM Clientes;
END

EXECUTE AgregarClientes
	@Nombres = 'Kevin Miguel' ,
	@Apellidos = 'Aparicio Hernandez',
	@DUI= '00011122-0',
	@FechaNac= '01-05-2002',
	@Telefono= '7777-0000',
	@Email= 'kevinaparicio@gmail.com',
	@ID_Direccion= '1'


--De consulta: Debe realizar una consulta (Multitabla, Subconsulta o Join) que muestre los registros de dos o más tablas.
CREATE PROCEDURE ObtenerMontoTotalCliente
AS 
BEGIN
	SELECT 
	CLI.Nombres,
	CLI.Apellidos,
	CLI.DUI,
	CLI.Telefono,
	FAC.Total AS Monto_Total
	FROM Clientes AS CLI, Facturas AS FAC
	WHERE CLI.ID_Cliente = FAC.ID_Cliente;
END

EXEC ObtenerMontoTotalCliente

-- Procedimiento almacenado que realiza una inserción o actualización en una tabla (por ejemplo, la tabla Ventas)
CREATE PROCEDURE InsertarVenta
    @FechaVenta DATETIME,
    @MontoVenta DECIMAL(10,2)
AS
BEGIN
   
    BEGIN
        -- Inserta una nueva venta en la tabla Ventas
        INSERT INTO Ventas ( FechaVenta, MontoVenta)
        VALUES ( @FechaVenta, @MontoVenta);
    END

END;
