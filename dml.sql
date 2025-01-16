insert into vehiculos (marca,modelo,anio,precio,estado) values
('Mazda','Mazda3',2025,90000000,'nuevo'),
('Chevrolet','Sail',2016,25000000,'usado'),
('Renault','logan',2020,40000000,'usado'),
('Kia','Sportage',2024,120000000,'nuevo');

insert into vehiculos (marca,modelo,anio,precio,estado,disponible) values
('Renault','logan',2022,60000000,'usado','FALSE'),
('Kia','Sportage',2023,110000000,'nuevo','FALSE'),
('Kia','Picanto',2015,20000000,'usado','FALSE');

insert into clientes (documento,nombre) values
(1234, 'Nicolas'),
(12345, 'Jose'),
(789, 'Natalia');

insert into clientes (documento,nombre,ventapotencial) values
(456, 'Arley','TRUE');

insert into vehiculos_de_interes (idvehiculo,idcliente) values 
(2,456);

insert into servicios (tiposervicio,idvehiculo,fecha) values 
('mantenimiento',3,'2024-01-01'),
('mantenimiento',3,'2025-01-01'),
('reparacion',2,'2024-10-01');

insert into horarios (dias,horainicio,horafin) values 
('sabado-domingo','10:00:00','06:00:00'),
('lunes-viernes','08:00:00','12:00:00'),
('lunes-viernes','12:00:00','06:00:00');

insert into empleados (documento,nombre,rol,departamento,fechacontratacion,idhorario) values 
(1,'Maria','vendedor','ventas','2020-01-01',1),
(2,'Edwin','mecanico','servicios','2018-01-01',2),
(3,'Josefo','mecanico','servicios','2019-01-01',3),
(4,'Conde','vendedor','ventas','2021-01-01',2);

insert into empleados_en_servicio (idservicio,idempleado) values 
(1,2),
(1,3),
(2,2),
(3,3);

insert into ventas (fecha,idvehiculo,idempleado,comision,total) values 
('2025-01-01',5,1,3000000,60000000),
('2025-01-10',6,4,6000000,110000000),
('2024-8-01',7,1,1000000,20000000);

insert into ventas_a_clientes (idcliente,idventa) values 
(789,1),
(1234,2)
(1234,3);

insert into proveedores (documento,nombre) values 
(741,'Partes de lujo');

insert into compras (fecha,idempleado,idproveedor,total) values 
('2025-01-01',2,741,20000000);
