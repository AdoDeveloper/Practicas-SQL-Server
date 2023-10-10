use Supermercado;

--Login Administrador
create login sysadmin_login
with password = 'root';
-- Login Gerente1
create login juanperez_login
with password = 'root';
--Login Supervisor1
create login sergiogomez_login
with password = 'root';
--Login RRHH1
create login anaguzman_login
with password = 'root';
--Login Contador1
create login reynalopez_login
with password = 'root';
--Login Bodeguero1
create login ignacio_login 
with password = 'root';
--Login Cajero1
create login carmen_login 
with password = 'root';

--Crear usuario Sysadmin
create user sysadmin_user
for login sysadmin_login;
--Crear usuario Gerente1
create user juanperez_user
for login juanperez_login;
--Crear usuario Supervisor1
create user sergiogomez_user
for login sergiogomez_login;
--Crear usuario RRHH1
create user anaguzman_user
for login anaguzman_login;
--Crear usuario Contador1
create user reynalopez_user 
for login reynalopez_login;
--Crear usuario Bodeguero1
create user ignacio_user 
for login ignacio_login;
--Crear usuario Cajero1
create user carmen_user 
for login carmen_login;

--Crear roles
create role Administrador;
create role Gerente;
create role Supervisor;
create role RRHH;
create role Contador;
create role Bodeguero;
create role Cajero;

--Unir miembros a los roles
alter role Administrador add member sysadmin_user;
alter role Gerente add member juanperez_user;
alter role Supervisor add member sergiogomez_user;
alter role RRHH add member anaguzman_user;
alter role Contador add member reynalopez_user;
alter role Bodeguero add member ignacio_user;
alter role Cajero add member carmen_user;

--Permisos para Administrador
grant select, insert, update, delete on dbo.Empleados to Administrador;
grant select, insert, update, delete on dbo.Cargos to Administrador;
grant select, insert, update, delete on dbo.Usuarios to Administrador;
grant select, insert, update, delete on dbo.Roles to Administrador;
grant select, insert, update, delete on dbo.AsignacionRolesOpciones to Administrador;
grant select, insert, update, delete on dbo.Direcciones to Administrador;
grant select, insert, update, delete on dbo.Distritos to Administrador;
grant select, insert, update, delete on dbo.Municipios to Administrador;
grant select, insert, update, delete on dbo.Departamentos to Administrador;

--Permisos para Gerente
grant select, insert, update, delete on dbo.Empleados to Gerente;
grant select, insert, update, delete on dbo.Cargos to Gerente;
grant select, insert, update, delete on dbo.Productos to Gerente;
grant select, insert, update, delete on dbo.Ventas to Gerente;

--Permisos para Supervisor
grant select, insert, update on dbo.Productos to Supervisor;
grant select, insert, update on dbo.Ventas to Supervisor;

--Permisos para RRHH
grant select, insert, update on dbo.Empleados to RRHH;

--Permisos para el Contador
grant select on Ventas to Contador;
grant select on Productos to Contador;
grant select on Pedidos to Contador;
grant select on Detalle_Pedidos to Contador;

--Permisos para Bodeguero
grant select on Proveedores to Bodeguero;
grant select, insert, update on Productos to Bodeguero;
grant select on Pedidos to Bodeguero;
grant select on Detalle_Pedidos to Bodeguero;

--Permisos para Cajero
grant select on Productos to Cajero;
grant select on Direcciones to Cajero;
grant select on Distritos to Cajero;
grant select on Municipios to Cajero;
grant select on Departamentos to Cajero;
grant select, insert, update on Ventas to Cajero;

-- Ver los roles y miembros que contiene --
SELECT 
    r.name AS 'Nombre del Rol',
    m.name AS 'Miembro'
FROM sys.database_role_members rm
INNER JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
INNER JOIN sys.database_principals m ON rm.member_principal_id = m.principal_id;

-- Ver los permisos de un rol
USE [Supermercado];
EXEC sp_msforeachtable 'PRINT ''?''; EXEC sp_helprotect ''?'', ''Administrador'';';

