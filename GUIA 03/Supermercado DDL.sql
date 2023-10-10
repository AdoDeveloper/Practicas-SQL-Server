-- CREAR LA BASE DE DATOS
create database Supermercado;
-- SELECCIONAR LA BASE DE DATOS
use Supermercado;

-- TABLAS
-- MANEJO DE ROLES
create table Usuarios(
	ID_Usuario int primary key identity(1, 1),	
    ID_Empleado int not null,
	ID_Rol int not null,
    Usuario varchar(60) not null,
    Clave varchar(60) not null,
);
go
create table Roles(
	ID_Rol int primary key identity(1, 1),
    NombreRol varchar(60) not null
);
go
create table Permisos(
	ID_Permiso int primary key identity(1, 1),
    ID_Opcion int not null,
    ID_Rol int not null,
	NombrePermiso varchar(60) not null
);
go
create table Opciones(
	ID_Opcion int primary key identity(1, 1),
    NombreOpcion varchar(60) not null
);
go
create table AsignacionRolesOpciones(
	ID_AsignacionRol int primary key identity(1, 1),
    ID_Rol int not null,
    ID_Opcion int not null
);
go

-- DIRECCIONES
go
create table Departamentos(
	ID_Departamento char(2) primary key,
	Departamento varchar(60) not null,
	Pais varchar(60) not null
);
go
create table Municipios(
	ID_Municipio char(3) primary key,
	Municipio varchar(60) not null,
	ID_Departamento char(2) not null
);
go
create table Distritos(
	ID_Distrito varchar(5) primary key,
	Distrito varchar(60) not null,
	ID_Municipio char(3) not null
);
go
create table Direcciones(
	ID_Direccion int primary key identity(1, 1),
    Linea1 varchar(100) not null,
    Linea2 varchar(100) not null,
    ID_Distrito varchar(5) not null,
    CodigoPostal int not null,
);

-- EMPLEADOS
go
create table Cargos(
	ID_Cargo int primary key identity(1, 1),
    Cargo varchar(45) not null
);
go
create table Empleados(
	ID_Empleado int primary key identity(1, 1),
    DUI_Empleado varchar(10) not null,
    ISSS_Empleado int not null,
    NombresEmpleado varchar(60) not null,
    ApellidosEmpleado varchar(60) not null,
    FechaNacEmpleado date not null,
    Telefono varchar(10) not null,
    Correo varchar(100) not null,
    ID_Cargo int not null,
    ID_Direccion int not null   
);
go

-- CLIENTES
create table Clientes(
	ID_Cliente int primary key identity(1,1),
	Nombres varchar (50) not null,
	Apellidos varchar (50) not null,
	DUI varchar (10) not null,
	FechaNac date not null,
	Telefono varchar(10) not null,
	Email varchar (30) not null,
	ID_Direccion int not null
);
go

-- PRODUCTOS
create table Productos(
ID_Producto int primary key identity(1,1),
Nombre_Producto varchar(50) not null,
Descripcion varchar(100) not null,
Precio_Unitario decimal(10,2) not null,
Existencia int not null
);
go

-- PROVEEDORES 
create table Proveedores(
ID_Proveedor int primary key identity(1,1),
Nombre_Proveedor varchar(50) not null,
Telefono_Proveedor varchar(10) not null,
ID_Direccion int not null
);
go

-- PEDIDOS
create table Pedidos(
ID_Pedido int primary key identity(1,1),
FechaPedido date not null,
Monto decimal(10,2) not null,
ID_Proveedor int not null
);
go

-- DETALLE PEDIDOS
create table Detalle_Pedidos(
ID_Detalle_Pedido int primary key identity(1,1),
Cantidad int not null,
ID_Pedido int not null,
ID_Producto int not null
);
go

-- VENTAS
create table Ventas(
ID_Venta int primary key identity(1,1),
FechaVenta date not null,
MontoVenta decimal(10,2) not null
);
go

-- DETALLE VENTAS
create table Detalle_Ventas(
ID_Detalle_Venta int primary key identity(1,1),
Cantidad_Producto int not null,
ID_Producto int not null,
ID_Venta int not null
);
go

-- FACTURAS
create table Facturas(
ID_Factura int primary key identity(1,1),
IVA decimal(10,2) not null,
Descuento decimal(10,2) not null,
SubTotal decimal(10,2) not null,
Total decimal(10,2) not null,
NIT varchar(20) not null,
ID_Cliente int not null,
ID_Venta int not null
);
go

-- Restricciones de clave foránea
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
alter table Usuarios add foreign key (ID_Empleado) references Empleados(ID_Empleado);
alter table Usuarios add foreign key (ID_Rol) references Roles(ID_Rol);
alter table AsignacionRolesOpciones add foreign key (ID_Rol) references Roles(ID_Rol);
alter table AsignacionRolesOpciones add foreign key (ID_Opcion) references Opciones(ID_Opcion);
alter table Permisos add foreign key (ID_Rol) references Roles(ID_Rol);
alter table Permisos add foreign key (ID_Opcion) references Opciones(ID_Opcion);