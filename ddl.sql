create type estado_vehiculo as enum
('nuevo','usado');

create table if not exists Vehiculos 
(id serial primary key,
marca varchar(50) not null,
modelo varchar(100) not null,
anio int not null,
precio numeric not null,
estado estado_vehiculo not null,
disponible boolean default('TRUE'));

create table if not exists Clientes
(documento int primary key,
nombre varchar(100) not null,
ventaPotencial boolean default('FALSE'));

create table if not exists Vehiculos_de_interes
(id serial primary key,
idVehiculo int references Vehiculos(id),
idCliente int references Clientes(documento));

create type tipo_servicio as enum
('mantenimiento','reparacion');

create table if not exists Servicios
(id serial primary key,
tipoServicio tipo_servicio not null,
idVehiculo int references Vehiculos(id),
fecha date not null);

create type tipo_horario as enum
('sabado-domingo','lunes-viernes');

create table if not exists Horarios
(id serial primary key,
dias tipo_horario not null,
horaInicio time not null,
horaFin time not null);

create type roles as enum
('vendedor','mecanico','administrativo');

create type departamentos as enum
('ventas','servicios');

create table if not exists Empleados
(documento int primary key,
nombre varchar(100) not null unique,
rol roles not null,
departamento departamentos not null,
fechaContratacion date not null,
idHorario int references Horarios(id));

create table if not exists Empleados_en_servicio
(id serial primary key,
idServicio int references Servicios(id),
idEmpleado int references Empleados(documento));

create table if not exists Ventas
(id serial primary key,
fecha date not null,
idVehiculo int references Vehiculos(id),
idEmpleado int references Empleados(documento),
comision numeric not null,
total numeric not null);

create table if not exists Ventas_a_clientes
(id serial primary key,
idCliente int references Clientes(documento),
idVenta int references Ventas(id));

create table if not exists Proveedores
(documento int primary key,
nombre varchar(100) not null unique);

create table if not exists Compras
(id serial primary key,
fecha date not null,
idEmpleado int references Empleados(documento),
idProveedor int references Proveedores(documento),
total numeric not null);
