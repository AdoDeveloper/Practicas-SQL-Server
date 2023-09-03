create database Supermercado;

use Supermercado;

create table Direcciones(
	ID_Direccion int primary key identity(1,1),
	Linea1 varchar(50),
	Linea2 varchar(50),
	CodigoPostal varchar(10),
	Pais varchar(50),
	ID_Distrito int
);

create table Distritos(
ID_Distrito int primary key identity(1,1),
Distrito varchar (50),
ID_Municipio int
);

create table Municipios(
ID_Municipio int primary key identity(1,1),
Municipio varchar(50),
ID_Departamento int
);

create table Departamentos(
ID_Departamento int primary key identity(1,1),
Departamento varchar(50)
);

create table Empleados(
ID_Empleado int primary key identity(1,1),
Nombres varchar (50),
Apellidos varchar (50),
DUI varchar (10),
ISSS varchar (30),
FechaNac date,
Telefono varchar(10),
Email varchar (30),
ID_Cargo int,
ID_Direccion int
);

create table Cargos(
ID_Cargo int primary key identity(1,1),
Cargo varchar(50)
);

create table Clientes(
ID_Cliente int primary key identity(1,1),
Nombres varchar (50),
Apellidos varchar (50),
DUI varchar (10),
FechaNac date,
Telefono varchar(10),
Email varchar (30),
ID_Direccion int
);

create table Productos(
ID_Producto int primary key identity(1,1),
Nombre_Producto varchar(50),
Descripcion varchar(100),
Precio_Unitario decimal(10,2),
Existencia int
);

create table Proveedores(
ID_Proveedor int primary key identity(1,1),
Nombre_Proveedor varchar(50),
Telefono_Proveedor varchar(10),
ID_Direccion int
);

create table Pedidos(
ID_Pedido int primary key identity(1,1),
FechaPedido date,
Monto decimal(10,2),
ID_Proveedor int
);

create table Detalle_Pedidos(
ID_Detalle_Pedido int primary key identity(1,1),
Cantidad int,
ID_Pedido int,
ID_Producto int
);

create table Ventas(
ID_Venta int primary key identity(1,1),
FechaVenta date,
MontoVenta decimal(10,2),
);

create table Detalle_Ventas(
ID_Detalle_Venta int primary key identity(1,1),
Cantidad_Producto int,
ID_Producto int,
ID_Venta int
);

create table Facturas(
ID_Factura int primary key identity(1,1),
IVA decimal(10,2),
Descuento decimal(10,2),
SubTotal decimal(10,2),
Total decimal(10,2),
NIT varchar(20),
ID_Cliente int,
ID_Venta int
);


alter table Direcciones add foreign key (ID_Distrito) references Distritos(ID_Distrito);
alter table Distritos add foreign key (ID_Municipio) references Municipios(ID_Municipio);
alter table Municipios add foreign key (ID_Departamento) references Departamentos(ID_Departamento);
alter table Empleados add foreign key (ID_Cargo) references Cargos(ID_Cargo);
alter table Empleados add foreign key (ID_Direccion) references Direcciones(ID_Direccion);
alter table Clientes add foreign key (ID_Direccion) references Direcciones(ID_Direccion);
alter table Proveedores add foreign key (ID_Direccion) references Direcciones(ID_Direccion);
alter table Pedidos add foreign key (ID_Proveedor) references Proveedores(ID_Proveedor);
alter table Detalle_Pedidos add foreign key (ID_Pedido) references Pedidos(ID_Pedido);
alter table Detalle_Pedidos add foreign key (ID_Producto) references Productos(ID_Producto);
alter table Detalle_Ventas add foreign key (ID_Producto) references Productos(ID_Producto);
alter table Detalle_Ventas add foreign key (ID_Venta) references Ventas(ID_Venta);
alter table Facturas add foreign key (ID_Cliente) references Clientes(ID_Cliente);
alter table Facturas add foreign key (ID_Venta) references Ventas(ID_Venta);