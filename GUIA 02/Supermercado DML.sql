use Supermercado;

-- Departamentos
insert into Departamentos values
	('Sonsonate'),
	('Ahuachapan'),
	('Santa Ana');

select * from Departamentos;

-- Municipios
insert into Municipios values
	('Nahuizalco', '1'),
	('Izalco', '1'),
	('Acajutla', '1'),
	('Sonsonate', '1'),
	('Guaymango', '2'),
	('Ahuachapan', '2'),
	('Santa Ana', '3');

select * from Municipios;

-- Distritos
insert into Distritos values
	('Sonsonate Norte', '1'),
	('Sonsonate Este', '2'),
	('Sonsonate Oeste', '3'),
	('Sonsonate Centro', '4'),
	('Ahuachapan Sur', '5'),
	('Ahuachapan Centro', '6'),
	('Santa Ana Centro', '7');

select * from Distritos;

-- Direcciones 
insert into Direcciones values
	('Col Madera, Calle 1, #1N', 'Frente al parque', '02302', 'El Salvador','1'),
	('Barrio El Caldero, Av 2, #2I', 'Frente al amate', '02306', 'El Salvador','2'),
	('Res El Cangrejo, Av 3, #3A', 'Frente a la playa', '02304', 'El Salvador','3'),
	('Barrio El Centro, Av 4, #4S', 'Frente a catedral', '02301', 'El Salvador','4'),
	('Col La Frontera, Calle 5, #5G', 'Km 10', '03350', 'El Salvador','5'),
	('Res Buenavista, Calle 6, #6A', 'Contiguo a alcaldia', '03351', 'El Salvador','6'),
	('Barrio Altavista, Av 7, #7S', 'Contiguo a SERTRACEN', '02090', 'El Salvador','7');

select * from Direcciones;

--Cargos
insert into Cargos values
('Gerente'),
('Supervisor'),
('Cajero');

select * from Cargos;

-- Empleados
insert into Empleados values
('Juan', 'Perez', '12345678-9', '123456789', '1990-05-15', '22223333', 'juan.perez@email.com', 1, 1),
('Maria', 'Lopez', '09876543-2', '555567890', '1985-08-20', '55556666', 'maria.lopez@email.com', 2, 2),
('Pedro', 'Gomez', '54321678-5', '987645678', '1995-03-10', '77778888', 'pedro.gomez@email.com', 3, 3),
('Ana', 'Rodriguez', '98765432-1', '014323456', '1980-11-05', '99990000', 'ana.rodriguez@email.com', 1, 4),
('Carlos', 'Martinez', '65432109-3', '0765378901', '1992-07-25', '33334444', 'carlos.martinez@email.com', 2, 5);

select * from Empleados;

-- Clientes
insert into Clientes values
('Eduardo', 'Fernandez', '11223344-5', '1988-09-10', '55551111', 'eduardo.fernandez@email.com', 1),
('Luisa', 'Gonzalez', '33445566-7', '1975-06-25', '77772222', 'luisa.gonzalez@email.com', 2),
('Roberto', 'Diaz', '66778899-0', '1993-02-15', '88883333', 'roberto.diaz@email.com', 3),
('Laura', 'Sanchez', '98761234-5', '1987-04-30', '99998888', 'laura.sanchez@email.com', 6),
('Isabel', 'Ramirez', '45678901-2', '1990-11-20', '11114444', 'isabel.ramirez@email.com', 7);

select * from Clientes;

-- Proveedores
insert into Proveedores values 
    ('Proveedor 1', '22223333', 1),
    ('Proveedor 2', '77778888', 2),
    ('Proveedor 3', '99990000', 3),
    ('Proveedor 4', '33334444', 4),
    ('Proveedor 5', '55556666', 5);

select * from Proveedores;

-- Productos
insert into Productos values
    ('Leche', 'Leche en polvo.', 1.49, 150),
    ('Azúcar', 'Azúcar blanca, 1 kg.', 1.99, 200),
    ('Pan', 'mataniño.', 2.49, 100),
    ('Aceite', 'Aceite de oliva, 1 litro.', 3.99, 80),
    ('Queso', 'La queso', 3.49, 120);

select * from Productos;

--Pedidos
insert into Pedidos values
    ('2023-08-01', 100.00, 1),
    ('2023-08-02', 150.50, 2),
    ('2023-08-03', 50.70, 1),
    ('2023-08-04', 230.25, 3),
    ('2023-08-05', 85.64, 2);

select * from Pedidos;

--Detalle_Pedidos
insert into Detalle_Pedidos values
  (90, 1, 1),
  (95, 2, 2),
  (40, 3, 3),
  (85, 4, 4),
  (36, 5, 5);

select * from Detalle_Pedidos;

--Ventas
insert into Ventas values
    ('2023-08-01', 149.00),
    ('2023-08-02', 200.99),
    ('2023-08-03', 74.70),
    ('2023-08-04', 299.25),
    ('2023-08-05', 125.64);

select * from Ventas;

--Detalle_Ventas
insert into Detalle_Ventas values
  (100, 1, 1),
  (101, 2, 2),
  (30, 3, 3),
  (75, 4, 4),
  (36, 5, 5);

select * from Detalle_Ventas;

--Facturas
insert into Facturas values
  (12.50, 5.00, 156.00, 156.00, '12345678978965', 1, 1),
  (8.00, 2.50, 283.49, 283.49, '33445566765012', 2, 2),
  (15.00, 8.20, 81.50, 81.50, '66778899009820', 3, 3),
  (10.25, 3.75, 305.75, 305.75, '98761234005125', 4, 4),
  (8.75, 2.00, 132.39, 132.39, '45678901082431', 5, 5);

select * from Facturas;



