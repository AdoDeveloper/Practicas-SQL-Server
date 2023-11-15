use Super;

create view vistaEmpleados
as select 
E.ID_Empleado,
E.DUI_Empleado,
E.ISSS_Empleado,
E.NombresEmpleado,
E.ApellidosEmpleado,
E.FechaNacEmpleado,
C.Cargo,
E.ID_Direccion
from Empleados E
inner join Cargos C on E.ID_Cargo = C.ID_Cargo;

select * from vistaEmpleados;
