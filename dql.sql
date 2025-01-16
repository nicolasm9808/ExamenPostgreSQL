--1. Listar Vehículos Disponibles: Obtener una lista de todos los vehículos disponibles para la venta, incluyendo detalles como marca, modelo, y precio.
select marca, modelo, anio as "año", precio from vehiculos v
where disponible = 'TRUE';

--2. Clientes con Compras Recientes: Mostrar los clientes que han realizado compras recientemente, junto con la información de los vehículos adquiridos.
select c.documento as "Documento Cliente", c.nombre as "Nombre Cliente", ve.marca as "Marca Vehiculo", ve.modelo as "Modelo", ve.anio as "Año"
from ventas_a_clientes vac
join clientes c on c.documento = vac.idcliente
join ventas v on v.id = vac.idventa
join vehiculos ve on ve.id = v.idvehiculo 
where v.fecha > '2025-01-1';

--3. Historial de Servicios por Vehículo: Obtener el historial completo de servicios realizados para un vehículo específico, incluyendo detalles sobre los empleados involucrados y las fechas de servicio.
select s.tipoServicio as "Tipo de servicio", s.fecha, e.documento as "Documento Empleado", e.nombre as"Nombre", e.rol from servicios s
join vehiculos v on v.id = s.idvehiculo
join empleados_en_servicio ees on ees.idservicio = s.id
join empleados e on e.documento = ees.idempleado
where v.id = 3;

--4. Proveedores de Piezas Utilizados: Listar los proveedores de piezas que han suministrado componentes utilizados en los servicios de mantenimiento.
select p.documento, p.nombre from proveedores p
left join compras c on c.id = p.documento;

--5. Rendimiento del Personal de Ventas: Calcular las comisiones generadas por cada empleado del departamento de ventas en un período específico.
select e.documento as "Documento Empleado", e.nombre as "Nombre Empleado", sum(v.comision) 
from empleados e
join ventas v on v.idempleado = e.documento
group by e.documento;

--6. Servicios Realizados por un Empleado: Identificar todos los servicios de mantenimiento realizados por un empleado específico, incluyendo detalles sobre los vehículos atendidos.
select s.tipoServicio as "Tipo de servicio", s.fecha, e.documento as "Documento Empleado", e.nombre as "Nombre Empleado", ve.marca as "Marca Vehiculo", ve.modelo as "Modelo", ve.anio as "Año"
from servicios s
join vehiculos ve on ve.id = s.idvehiculo
join empleados_en_servicio ees on ees.idservicio = s.id
join empleados e on e.documento = ees.idempleado
where e.documento = 3;

--7. Clientes Potenciales y Vehículos de Interés: Mostrar información sobre los clientes potenciales y los vehículos de su interés, proporcionando pistas valiosas para estrategias de marketing.
select c.documento as"Documento Cliente", c.nombre as "Nombre Cliente", ve.marca as "Marca Vehiculo", ve.modelo as "Modelo", ve.anio as "Año"
from clientes c
join vehiculos_de_interes vdi on vdi.idcliente = c.documento
join vehiculos ve on ve.id = vdi.idvehiculo
where c.ventapotencial = 'TRUE';

--8. Empleados del Departamento de Servicio: Listar todos los empleados que pertenecen al departamento de servicio, junto con sus horarios de trabajo.
select e.documento as "Documento Empleado", e.nombre as "Nombre Empleado", h.dias as "Horario", h.horaInicio, h.horaFin
from empleados e
join horarios h on h.id = e.idhorario
where e.departamento = 'servicios';

--9. Vehículos Vendidos en un Rango de Precios: Encontrar los vehículos vendidos en un rango de precios específico, proporcionando datos útiles para análisis de ventas.
select ve.marca as "Marca Vehiculo", ve.modelo as "Modelo", ve.anio as "Año", v.total 
from vehiculos ve
join ventas v on v.idvehiculo = ve. id
where v.total >= 100000000 and v.total <= 200000000;

--10. Clientes con Múltiples Compras: Identificar a aquellos clientes que han realizado más de una compra en el concesionario, destacando la lealtad del cliente.
select c.documento as"Documento Cliente", c.nombre as "Nombre Cliente", count(vac.idcliente) as "Vehiculos comprados"
from clientes c
join ventas_a_clientes vac on vac.idcliente = c.documento
group by c.documento;

