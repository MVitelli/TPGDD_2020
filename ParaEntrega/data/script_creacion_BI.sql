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

IF OBJECT_ID('FELICES_PASCUAS.D_Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Pasaje;

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

IF OBJECT_ID('FELICES_PASCUAS.D_Habitacion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Habitacion;

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
	tiempo_id decimal(18,0) not null,
	tiempo_mes int not null,
	tiempo_anio int not null
);

create table FELICES_PASCUAS.D_Pasaje(
	pasaje_id decimal(18,0) not null,
	pasaje_costo decimal(18,2) not null,
	pasaje_precio decimal (18,2) not null,
	pasaje_costo_extra decimal (18,2),
	pasaje_vuelo decimal(18,0) not null,
	pasaje_cliente decimal (18,0) not null,
	pasaje_sucursal nvarchar(255),
	pasaje_compra_fecha datetime2(3) not null,
	pasaje_venta_fecha datetime2(3)
);

create table FELICES_PASCUAS.D_Ruta(
	ruta_id decimal(18,0) not null,
	ruta_ciu_orig decimal(18,0) not null,
	ruta_ciu_dest decimal(18,0) not null
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

create table FELICES_PASCUAS.D_Habitacion(
	habitacion_id int identity(1,1),
	habitacion_hotel_calle nvarchar(50) not null,
	habitacion_hotel_calle_nro decimal (18,0) not null,
	habitacion_tipo nvarchar(50) not null,
	habitacion_frente nvarchar(50),
	habitacion_costo decimal(18,2),
	habitacion_precio decimal (18,2),
	habitacion_cargo_extra decimal (18,0),
	habitacion_check_in datetime2(3),
	habitacion_check_out datetime2(3),
	habitacion_cliente decimal(18,0),
	habitacion_sucursal nvarchar(255),
	habitacion_factura_fecha datetime2(3)
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

ALTER TABLE FELICES_PASCUAS.D_Pasaje
ADD CONSTRAINT PK_D_Pasaje PRIMARY KEY (pasaje_id);

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

ALTER TABLE FELICES_PASCUAS.D_Habitacion
ADD CONSTRAINT PK_D_Habitacion PRIMARY KEY (habitacion_id);

-------------------- Creación de foreign keys ---------------------------

-------------------- Migración de tablas OLTP a tablas OLAP  --------------------


