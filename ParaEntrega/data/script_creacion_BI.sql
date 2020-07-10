USE GD1C2020;
GO

/* Eliminación de los objetos preexistentes */

------------ Eliminación de tablas    ------------------
IF OBJECT_ID('FELICES_PASCUAS.D_Cliente','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Cliente;

IF OBJECT_ID('FELICES_PASCUAS.D_Sucursal','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Sucursal;

IF OBJECT_ID('FELICES_PASCUAS.D_Proveedor','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Proveedor;

IF OBJECT_ID('FELICES_PASCUAS.D_Tiempo','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Tiempo;

IF OBJECT_ID('FELICES_PASCUAS.D_Ruta','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Ruta;

IF OBJECT_ID('FELICES_PASCUAS.D_Tipo_Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Tipo_Pasaje;

IF OBJECT_ID('FELICES_PASCUAS.D_Avion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Avion;

IF OBJECT_ID('FELICES_PASCUAS.D_Ciudad','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Ciudad;

IF OBJECT_ID('FELICES_PASCUAS.D_Tipo_Habitacion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Tipo_Habitacion;

IF OBJECT_ID('FELICES_PASCUAS.D_Hotel','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Hotel;

-------------------- Creación de tablas ---------------------------

create table FELICES_PASCUAS.D_Cliente(
	cliente_id decimal(18,0) not null,
	cliente_dni decimal(18,0),
	cliente_apellido nvarchar(255),
	cliente_nombre nvarchar(255),
	cliente_edad int,
	cliente_mail nvarchar(255),
	cliente_telefono int
);

create table FELICES_PASCUAS.D_Sucursal(
	sucursal_id decimal(18,0) not null,
	sucursal_direccion nvarchar(255),
	sucursal_mail nvarchar(255),
	sucursal_telefono decimal(18,0)
);

create table FELICES_PASCUAS.D_Proveedor(
	proveedor_id decimal(18,0) not null,
	proveedor_razon_social nvarchar(255),
);

create table FELICES_PASCUAS.D_Tiempo(
	tiempo_id int identity(1,1),
	tiempo_mes int not null,
	tiempo_anio int not null
);

create table FELICES_PASCUAS.D_Ruta(
	ruta_id decimal(18,0) not null,
	ruta_ciu_orig nvarchar(255) not null,
	ruta_ciu_dest nvarchar(255) not null
);

create table FELICES_PASCUAS.D_Tipo_Pasaje(
	tipo_pasaje_id decimal(18,0) not null,
	tipo_pasaje_descripcion nvarchar(255)
);

create table FELICES_PASCUAS.D_Avion(
	avion_id nvarchar(50) not null,
	avion_modelo nvarchar(50)
);

create table FELICES_PASCUAS.D_Ciudad(
	ciudad_id decimal(18,0) not null,
	ciudad_descripcion nvarchar(255)
);

create table FELICES_PASCUAS.D_Tipo_Habitacion(
	tipo_habitacion_id decimal(18,0) not null,
	tipo_habitacion_desc nvarchar(50) not null,
	cantidad_camas int not null
);

create table FELICES_PASCUAS.D_Hotel(
	hotel_id decimal(18,0) not null,
	hotel_calle nvarchar(50),
	hotel_nro_calle decimal(18,0),
	hotel_cant_estrellas decimal (18,0)
);
-------------------- Creación de primary keys ---------------------------

ALTER TABLE FELICES_PASCUAS.D_Cliente 
ADD CONSTRAINT PK_D_Cliente PRIMARY KEY (cliente_id);

ALTER TABLE FELICES_PASCUAS.D_Sucursal 
ADD CONSTRAINT PK_D_Sucursal PRIMARY KEY (sucursal_id);

ALTER TABLE FELICES_PASCUAS.D_Proveedor 
ADD CONSTRAINT PK_D_Proveedor PRIMARY KEY (proveedor_id);

ALTER TABLE FELICES_PASCUAS.D_Tiempo 
ADD CONSTRAINT PK_D_Tiempo PRIMARY KEY (tiempo_id);

ALTER TABLE FELICES_PASCUAS.D_Ruta
ADD CONSTRAINT PK_D_Ruta PRIMARY KEY (ruta_id);

ALTER TABLE FELICES_PASCUAS.D_Tipo_Pasaje
ADD CONSTRAINT PK_D_Tipo_Pasaje PRIMARY KEY (tipo_pasaje_id);

ALTER TABLE FELICES_PASCUAS.D_Avion
ADD CONSTRAINT PK_D_Avion PRIMARY KEY (avion_id);

ALTER TABLE FELICES_PASCUAS.D_Ciudad
ADD CONSTRAINT PK_D_Ciudad PRIMARY KEY (ciudad_id);

ALTER TABLE FELICES_PASCUAS.D_Tipo_Habitacion
ADD CONSTRAINT PK_D_Tipo_Habitacion PRIMARY KEY (tipo_habitacion_id);

ALTER TABLE FELICES_PASCUAS.D_Hotel
ADD CONSTRAINT PK_D_Hotel PRIMARY KEY (hotel_id);

-------------------- Creación de foreign keys ---------------------------



-------------------- Migración de tablas OLTP a tablas OLAP  --------------------

--Ciudad
insert into FELICES_PASCUAS.D_Ciudad 
	select * from FELICES_PASCUAS.Ciudad



--Ruta
insert into FELICES_PASCUAS.D_Ruta
	select r.ruta_aerea_id, c.ciudad_descripcion, c2.ciudad_descripcion from FELICES_PASCUAS.Ruta_Aerea r
		join FELICES_PASCUAS.Ciudad c on c.ciudad_codigo = r.ruta_aerea_ciu_orig
		join FELICES_PASCUAS.Ciudad c2 on c2.ciudad_codigo = r.ruta_aerea_ciu_dest 



--Avion
insert into FELICES_PASCUAS.D_Avion
	select * from FELICES_PASCUAS.Avion



--Tiempo

--agrupamos todas las operaciones que tengan fechas y agarramos el max/min para obtener mes y año de éstas. No fue necesario usar max/min porque están todos los meses del intervalo
insert into FELICES_PASCUAS.D_Tiempo
	select YEAR(compra_pasaje_fecha) as anio, MONTH(compra_pasaje_fecha) as mes from FELICES_PASCUAS.Compra_Pasaje 
		UNION
	select YEAR(estadia_fecha_compra) as anio, MONTH(estadia_fecha_compra) as mes from FELICES_PASCUAS.Compra_Estadia 
		UNION
	select YEAR(estadia_fecha_inicio) as anio, MONTH(estadia_fecha_inicio) as mes from FELICES_PASCUAS.Compra_Estadia
		UNION
	select YEAR(DATEADD(day, estadia_cant_noches, estadia_fecha_inicio)) as anio, MONTH(DATEADD(day, estadia_cant_noches, estadia_fecha_inicio)) as mes from FELICES_PASCUAS.Compra_Estadia
		UNION
	select YEAR(factura_fecha) as anio, MONTH(factura_fecha) as mes from FELICES_PASCUAS.Factura
		UNION
	select YEAR(venta_estadia_check_in) as anio, MONTH(venta_estadia_check_in) as mes from FELICES_PASCUAS.Venta_Estadia
		UNION
	select YEAR(venta_estadia_check_out) as anio, MONTH(venta_estadia_check_out) as mes from FELICES_PASCUAS.Venta_Estadia
		UNION
	select YEAR(vuelo_fecha_salida) as anio, MONTH(vuelo_fecha_salida) as mes from FELICES_PASCUAS.Vuelo
		UNION
	select YEAR(vuelo_fecha_llegada) as anio, MONTH(vuelo_fecha_llegada) as mes from FELICES_PASCUAS.Vuelo
order by anio, mes



--Cliente
insert into FELICES_PASCUAS.D_Cliente
	select cliente_id,YEAR(GETDATE()) - YEAR(cliente_fecha_nacimiento), cliente_dni, cliente_apellido, cliente_nombre, cliente_mail, cliente_telefono
	from FELICES_PASCUAS.Cliente



--Sucursal
insert into FELICES_PASCUAS.D_Sucursal
	select * from FELICES_PASCUAS.Sucursal



--Tipo_Pasaje
insert into FELICES_PASCUAS.D_Tipo_Pasaje
	select * from FELICES_PASCUAS.Tipo_Butaca



--Proveedor
insert into FELICES_PASCUAS.D_Proveedor
	select * from FELICES_PASCUAS.Empresa



--Tipo_Habitacion
--asumimos que simple = 1 cama, doble = 2, triple = 3, cuadruple = 4, king = 4
insert into FELICES_PASCUAS.D_Tipo_Habitacion
	(tipo_habitacion_id, tipo_habitacion_desc)
	select * from FELICES_PASCUAS.Tipo_Habitacion

update FELICES_PASCUAS.D_Tipo_Habitacion
	set cantidad_camas = 1 where tipo_habitacion_desc= 'Base Simple'
update FELICES_PASCUAS.D_Tipo_Habitacion
	set cantidad_camas = 2 where tipo_habitacion_desc= 'Base Doble'
update FELICES_PASCUAS.D_Tipo_Habitacion
	set cantidad_camas = 3 where tipo_habitacion_desc= 'Base Triple'
update FELICES_PASCUAS.D_Tipo_Habitacion
	set cantidad_camas = 4 where tipo_habitacion_desc= 'Base Cuadruple'
update FELICES_PASCUAS.D_Tipo_Habitacion
	set cantidad_camas = 4 where tipo_habitacion_desc= 'King'



--Hotel
insert into FELICES_PASCUAS.D_Hotel
	select * from FELICES_PASCUAS.Hotel