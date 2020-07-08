USE GD1C2020;
GO

/* Eliminación de los objetos preexistentes */

------------ Eliminación de tablas    ------------------
IF OBJECT_ID('FELICES_PASCUAS.D_Cliente','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Cliente;

IF OBJECT_ID('FELICES_PASCUAS.D_Sucursal','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Sucursal;

IF OBJECT_ID('FELICES_PASCUAS.D_Empresa','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Empresa;

IF OBJECT_ID('FELICES_PASCUAS.D_Tiempo','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Tiempo;

IF OBJECT_ID('FELICES_PASCUAS.D_Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Pasaje;

-------------------- Creación de tablas ---------------------------

create table FELICES_PASCUAS.D_Cliente(
	cliente_id decimal(18,0) not null,
	cliente_dni decimal(18,0),
	cliente_apellido nvarchar(255),
	cliente_nombre nvarchar(255),
	cliente_fecha_nacimiento datetime2(3),
	cliente_mail nvarchar(255),
	cliente_telefono int
);

create table FELICES_PASCUAS.D_Sucursal(
	sucursal_id decimal(18,0) not null,
	sucursal_direccion nvarchar(255),
	sucursal_mail nvarchar(255),
	sucursal_telefono decimal(18,0)
);

create table FELICES_PASCUAS.D_Empresa(
	empresa_id decimal(18,0) not null,
	empresa_razon_social nvarchar(255),
);

create table FELICES_PASCUAS.D_Tiempo(
	tiempo_id decimal(18,0) not null,
	mes int not null,
	anio int not null
);

create table FELICES_PASCUAS.D_Pasaje(
	pasaje_codigo decimal(18,0) not null,
	pasaje_costo decimal(18,2),
	pasaje_precio decimal (18,2),
	pasaje_vuelo decimal(18,0) not null,
	pasaje_costo_extra decimal (18,2),
	pasaje_compra_fecha datetime2(3),
	pasaje_venta_fecha datetime2(3)
);

-------------------- Creación de primary keys ---------------------------

ALTER TABLE FELICES_PASCUAS.D_Cliente 
ADD CONSTRAINT PK_D_Cliente PRIMARY KEY (cliente_id);

ALTER TABLE FELICES_PASCUAS.D_Sucursal 
ADD CONSTRAINT PK_D_Sucursal PRIMARY KEY (sucursal_id);

ALTER TABLE FELICES_PASCUAS.D_Empresa 
ADD CONSTRAINT PK_D_Empresa PRIMARY KEY (empresa_id);

ALTER TABLE FELICES_PASCUAS.D_Tiempo 
ADD CONSTRAINT PK_D_Tiempo PRIMARY KEY (tiempo_id);

ALTER TABLE FELICES_PASCUAS.D_Pasaje
ADD CONSTRAINT PK_D_Pasaje PRIMARY KEY (pasaje_id);