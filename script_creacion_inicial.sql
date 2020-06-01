USE GD1C2020;
GO

/* Eliminación de los objetos preexistentes */

------------ Eliminación de tablas    ------------------
IF OBJECT_ID('FELICES_PASCUAS.Venta_Estadia_Habitacion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Venta_Estadia_Habitacion;

IF OBJECT_ID('FELICES_PASCUAS.Estadia_Habitacion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Estadia_Habitacion;
	
IF OBJECT_ID('FELICES_PASCUAS.Habitacion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Habitacion;

IF OBJECT_ID('FELICES_PASCUAS.Tipo_Habitacion','U') IS NOT NULL
    DROP TABLE FELICES_PASCUAS.Tipo_Habitacion;

IF OBJECT_ID('FELICES_PASCUAS.Venta_Estadia','U') IS NOT NULL
    DROP TABLE FELICES_PASCUAS.Venta_Estadia;

IF OBJECT_ID('FELICES_PASCUAS.Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Pasaje;

IF OBJECT_ID('FELICES_PASCUAS.Venta_Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Venta_Pasaje;

IF OBJECT_ID('FELICES_PASCUAS.Factura','U') IS NOT NULL
    DROP TABLE FELICES_PASCUAS.Factura;

IF OBJECT_ID('FELICES_PASCUAS.Cliente','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Cliente;

IF OBJECT_ID('FELICES_PASCUAS.Compra_Estadia','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Compra_Estadia;

IF OBJECT_ID('FELICES_PASCUAS.Hotel','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Hotel;

IF OBJECT_ID('FELICES_PASCUAS.Sucursal','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Sucursal;

IF OBJECT_ID('FELICES_PASCUAS.Compra_Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Compra_Pasaje;

IF OBJECT_ID('FELICES_PASCUAS.Empresa','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Empresa;

IF OBJECT_ID('FELICES_PASCUAS.Vuelo','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Vuelo;

IF OBJECT_ID('FELICES_PASCUAS.Ruta_Aerea','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Ruta_Aerea;

IF OBJECT_ID('FELICES_PASCUAS.Ciudad','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Ciudad;

IF OBJECT_ID('FELICES_PASCUAS.Butaca','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Butaca;

IF OBJECT_ID('FELICES_PASCUAS.Tipo_Butaca','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Tipo_Butaca;

IF OBJECT_ID('FELICES_PASCUAS.Avion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Avion;

IF OBJECT_ID('FELICES_PASCUAS.Inconsistencia','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Inconsistencia;

-------------------- Eliminación del esquema ---------------------------

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'FELICES_PASCUAS')
    DROP SCHEMA FELICES_PASCUAS
GO
 
-------------------- Creación del esquema ---------------------------
CREATE SCHEMA FELICES_PASCUAS;
GO

-------------------- Creación de tablas ---------------------------

create table FELICES_PASCUAS.Tipo_Habitacion(
	tipo_habitacion_codigo decimal(18,0) not null,
	tipo_habitacion_desc nvarchar(50)
);

create table FELICES_PASCUAS.Habitacion(
	habitacion_id decimal(18,0) not null,
	habitacion_hotel decimal(18,0) not null,
	habitacion_tipo decimal(18,0) not null,
	habitacion_numero decimal(18,0) not null,
	habitacion_piso decimal(18,0),
	habitacion_frente nvarchar(50),
	habitacion_costo decimal(18,2),
	habitacion_precio decimal (18,2)
);

create table FELICES_PASCUAS.Hotel(
	hotel_id decimal(18,0) not null,
	hotel_calle nvarchar(50),
	hotel_nro_calle decimal(18,0),
	hotel_cant_estrellas decimal (18,0)
);

create table FELICES_PASCUAS.Venta_Estadia(
	venta_estadia_id decimal(18,0) not null,
	venta_estadia_factura decimal(18,0) not null,
	venta_estadia_cargo_extra decimal (18,0),
	venta_estadia_check_in datetime2(3),
	venta_estadia_check_out datetime2(3)
);

create table FELICES_PASCUAS.Venta_Estadia_Habitacion(
	venta_estadia_id decimal(18,0) not null,
	habitacion_id decimal(18,0) not null
);

create table FELICES_PASCUAS.Factura(
	factura_nro decimal(18,0) not null,
	factura_sucursal decimal(18,0) not null,
	factura_cliente decimal (18,0) not null,
	factura_fecha datetime2(3)
);

create table FELICES_PASCUAS.Cliente(
	cliente_id decimal(18,0) not null,
	cliente_dni decimal(18,0),
	cliente_apellido nvarchar(255),
	cliente_nombre nvarchar(255),
	cliente_fecha_nacimiento datetime2(3),
	cliente_mail nvarchar(255),
	cliente_telefono int
);

create table FELICES_PASCUAS.Compra_Estadia(
	estadia_codigo decimal(18,0) not null,
	estadia_fecha_compra datetime2(3),
	estadia_numero_compra decimal(18,0),
	estadia_fecha_inicio datetime2(3),
	estadia_cant_noches decimal(18,0),
	estadia_empresa decimal(18,0) not null,
);

create table FELICES_PASCUAS.Venta_Pasaje(
	venta_pasaje_id decimal(18,0) not null,
	venta_pasaje_factura decimal(18,0) not null,
	venta_pasaje_cargo_extra decimal(18,2)
);

create table FELICES_PASCUAS.Estadia_Habitacion(
	estadia_codigo decimal(18,0) not null,
	habitacion_id decimal(18,0) not null
);

create table FELICES_PASCUAS.Sucursal(
	sucursal_id decimal(18,0) not null,
	sucursal_direccion nvarchar(255),
	sucursal_mail nvarchar(255),
	sucursal_telefono decimal(18,0)
);

create table FELICES_PASCUAS.Compra_Pasaje(
	compra_pasaje_id decimal(18,0) not null,
	compra_pasaje_fecha datetime2(3),
	compra_pasaje_numero decimal(18,0)
);

create table FELICES_PASCUAS.Pasaje(
	pasaje_codigo decimal(18,0) not null,
	pasaje_empresa decimal(18,0) not null,
	pasaje_butaca decimal(18,0) not null,
	pasaje_costo decimal(18,2),
	pasaje_precio decimal (18,2),
	pasaje_compra decimal(18,0) not null,
	pasaje_venta decimal(18,0),
	pasaje_vuelo decimal(18,0) not null
);

create table FELICES_PASCUAS.Empresa(
	empresa_id decimal(18,0) not null,
	empresa_razon_social nvarchar(255)
);

create table FELICES_PASCUAS.Ciudad(
	ciudad_codigo decimal(18,0) not null,
	ciudad_descripcion nvarchar(255)
);

create table FELICES_PASCUAS.Ruta_Aerea(
	ruta_aerea_id decimal(18,0) not null,
	ruta_aerea_codigo decimal(18,0),
	ruta_aerea_ciu_orig decimal(18,0) not null,
	ruta_aerea_ciu_dest decimal(18,0) not null
);

create table FELICES_PASCUAS.Vuelo(
	vuelo_codigo decimal(18,0) not null,
	vuelo_fecha_salida datetime2(3),
	vuelo_fecha_llegada datetime2(3),
	vuelo_ruta_aerea decimal (18,0) not null,
	vuelo_avion nvarchar(50) not null
);

create table FELICES_PASCUAS.Tipo_Butaca(
	tipo_butaca_codigo decimal(18,0) not null,
	tipo_butaca_descripcion nvarchar(255)
);

create table FELICES_PASCUAS.Avion(
	avion_identificador nvarchar(50) not null,
	avion_modelo nvarchar(50)
);

create table FELICES_PASCUAS.Butaca(
	butaca_id decimal(18,0) not null,
	butaca_numero decimal(18,0),
	butaca_tipo decimal(18,0),
	butaca_avion nvarchar(50) not null
);

create table FELICES_PASCUAS.Inconsistencia(
    inconsistencia_id decimal(18,0) not null,
	inconsistencia_atributo nvarchar(50),
	inconsistencia_detalle nvarchar(255)
);

-------------------- Creación de primary keys ---------------------------

ALTER TABLE FELICES_PASCUAS.Inconsistencia 
ADD CONSTRAINT PK_Inconsistencia PRIMARY KEY (inconsistencia_id);

ALTER TABLE FELICES_PASCUAS.Tipo_Habitacion 
ADD CONSTRAINT PK_Tipo_Habitacion PRIMARY KEY (tipo_habitacion_codigo);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia_Habitacion 
ADD CONSTRAINT PK_Venta_Estadia_Habitacion PRIMARY KEY (venta_estadia_id, habitacion_id);

ALTER TABLE FELICES_PASCUAS.Habitacion 
ADD CONSTRAINT PK_Habitacion PRIMARY KEY (habitacion_id);

ALTER TABLE FELICES_PASCUAS.Estadia_Habitacion 
ADD CONSTRAINT PK_Estadia_Habitacion PRIMARY KEY (habitacion_id, estadia_codigo);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia 
ADD CONSTRAINT PK_Venta_Estadia PRIMARY KEY (venta_estadia_id);

ALTER TABLE FELICES_PASCUAS.Factura 
ADD CONSTRAINT PK_Factura PRIMARY KEY (factura_nro);

ALTER TABLE FELICES_PASCUAS.Cliente 
ADD CONSTRAINT PK_Cliente PRIMARY KEY (cliente_id);

ALTER TABLE FELICES_PASCUAS.Hotel 
ADD CONSTRAINT PK_Hotel PRIMARY KEY (hotel_id);

ALTER TABLE FELICES_PASCUAS.Compra_Estadia
ADD CONSTRAINT PK_Compra_Estadia PRIMARY KEY (estadia_codigo);

ALTER TABLE FELICES_PASCUAS.Venta_Pasaje 
ADD CONSTRAINT PK_Venta_Pasaje PRIMARY KEY (venta_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Sucursal 
ADD CONSTRAINT PK_Sucursal PRIMARY KEY (sucursal_id);

ALTER TABLE FELICES_PASCUAS.Compra_Pasaje 
ADD CONSTRAINT PK_Compra_Pasaje PRIMARY KEY (compra_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Pasaje 
ADD CONSTRAINT PK_Pasaje PRIMARY KEY (pasaje_codigo);

ALTER TABLE FELICES_PASCUAS.Empresa 
ADD CONSTRAINT PK_Empresa PRIMARY KEY (empresa_id);

ALTER TABLE FELICES_PASCUAS.Ciudad 
ADD CONSTRAINT PK_Ciudad PRIMARY KEY (ciudad_codigo);

ALTER TABLE FELICES_PASCUAS.Ruta_Aerea 
ADD CONSTRAINT PK_Ruta_Aerea PRIMARY KEY (ruta_aerea_id);

ALTER TABLE FELICES_PASCUAS.Vuelo 
ADD CONSTRAINT PK_Vuelo PRIMARY KEY (vuelo_codigo);

ALTER TABLE FELICES_PASCUAS.Tipo_Butaca 
ADD CONSTRAINT PK_Tipo_Butaca PRIMARY KEY (tipo_butaca_codigo);

ALTER TABLE FELICES_PASCUAS.Avion 
ADD CONSTRAINT PK_Avion PRIMARY KEY (avion_identificador);

ALTER TABLE FELICES_PASCUAS.Butaca 
ADD CONSTRAINT PK_Butaca PRIMARY KEY (butaca_id);

-------------------- Creación de foreign keys ---------------------------

ALTER TABLE FELICES_PASCUAS.Habitacion ADD CONSTRAINT FK_Habitacion_Hotel 
FOREIGN KEY (habitacion_hotel) REFERENCES FELICES_PASCUAS.Hotel(hotel_id);

ALTER TABLE FELICES_PASCUAS.Habitacion ADD CONSTRAINT FK_Habitacion_TipoHabitacion
FOREIGN KEY (habitacion_tipo) REFERENCES FELICES_PASCUAS.Tipo_Habitacion(tipo_habitacion_codigo);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia_Habitacion ADD CONSTRAINT FK_VentaEstadiaHabitacion_Habitacion
FOREIGN KEY (habitacion_id) REFERENCES FELICES_PASCUAS.Habitacion(habitacion_id);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia_Habitacion ADD CONSTRAINT FK_VentaEstadiaHabitacion_VentaEstadia
FOREIGN KEY (venta_estadia_id) REFERENCES FELICES_PASCUAS.Venta_Estadia(venta_estadia_id);

ALTER TABLE FELICES_PASCUAS.Factura ADD CONSTRAINT FK_Factura_Sucursal
FOREIGN KEY (factura_sucursal) REFERENCES FELICES_PASCUAS.Sucursal(sucursal_id);

ALTER TABLE FELICES_PASCUAS.Factura ADD CONSTRAINT FK_Factura_Cliente
FOREIGN KEY (factura_cliente) REFERENCES FELICES_PASCUAS.Cliente(cliente_id);

ALTER TABLE FELICES_PASCUAS.Venta_Pasaje ADD CONSTRAINT FK_VentaPasaje_Factura
FOREIGN KEY (venta_pasaje_factura) REFERENCES FELICES_PASCUAS.Factura(factura_nro);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia ADD CONSTRAINT FK_VentaEstadia_Factura
FOREIGN KEY (venta_estadia_factura) REFERENCES FELICES_PASCUAS.Factura(factura_nro);

ALTER TABLE FELICES_PASCUAS.Estadia_Habitacion ADD CONSTRAINT FK_EstadiaHabitacion_Habitacion
FOREIGN KEY (habitacion_id) REFERENCES FELICES_PASCUAS.Habitacion(habitacion_id);

ALTER TABLE FELICES_PASCUAS.Estadia_Habitacion ADD CONSTRAINT FK_EstadiaHabitacion_Estadia
FOREIGN KEY (estadia_codigo) REFERENCES FELICES_PASCUAS.Compra_Estadia(estadia_codigo);

ALTER TABLE FELICES_PASCUAS.Compra_Estadia ADD CONSTRAINT FK_CompraEstadia_Empresa
FOREIGN KEY (estadia_empresa) REFERENCES FELICES_PASCUAS.Empresa(empresa_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_Butaca
FOREIGN KEY (pasaje_butaca) REFERENCES FELICES_PASCUAS.Butaca(butaca_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_Empresa
FOREIGN KEY (pasaje_empresa) REFERENCES FELICES_PASCUAS.Empresa(empresa_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_CompraPasaje
FOREIGN KEY (pasaje_compra) REFERENCES FELICES_PASCUAS.Compra_Pasaje(compra_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_VentaPasaje
FOREIGN KEY (pasaje_venta) REFERENCES FELICES_PASCUAS.Venta_Pasaje(venta_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_Vuelo
FOREIGN KEY (pasaje_vuelo) REFERENCES FELICES_PASCUAS.Vuelo(vuelo_codigo);

ALTER TABLE FELICES_PASCUAS.Ruta_Aerea ADD CONSTRAINT FK_RutaAerea_CiudadO
FOREIGN KEY (ruta_aerea_ciu_orig) REFERENCES FELICES_PASCUAS.Ciudad(ciudad_codigo);

ALTER TABLE FELICES_PASCUAS.Ruta_Aerea ADD CONSTRAINT FK_RutaAerea_CiudadD
FOREIGN KEY (ruta_aerea_ciu_dest) REFERENCES FELICES_PASCUAS.Ciudad(ciudad_codigo);

ALTER TABLE FELICES_PASCUAS.Vuelo ADD CONSTRAINT FK_Vuelo_RutaAerea
FOREIGN KEY (vuelo_ruta_aerea) REFERENCES FELICES_PASCUAS.Ruta_Aerea(ruta_aerea_id);

ALTER TABLE FELICES_PASCUAS.Vuelo ADD CONSTRAINT FK_Vuelo_Avion
FOREIGN KEY (vuelo_avion) REFERENCES FELICES_PASCUAS.Avion(avion_identificador);

ALTER TABLE FELICES_PASCUAS.Butaca ADD CONSTRAINT FK_Butaca_Avion
FOREIGN KEY (butaca_avion) REFERENCES FELICES_PASCUAS.Avion(avion_identificador);

ALTER TABLE FELICES_PASCUAS.Butaca ADD CONSTRAINT FK_Butaca_TipoButaca
FOREIGN KEY (butaca_tipo) REFERENCES FELICES_PASCUAS.Tipo_Butaca(tipo_butaca_codigo);


-------------------- Migración de tablas ---------------------------

insert into FELICES_PASCUAS.Empresa
select row_number() over (order by (select NULL)), EMPRESA_RAZON_SOCIAL
from gd_esquema.Maestra
group by EMPRESA_RAZON_SOCIAL



insert into FELICES_PASCUAS.Ciudad
select row_number() over (order by (select NULL)), RUTA_AEREA_CIU_ORIG
from gd_esquema.Maestra
where RUTA_AEREA_CIU_ORIG is not null
group by RUTA_AEREA_CIU_ORIG



insert into FELICES_PASCUAS.Avion
select AVION_IDENTIFICADOR, AVION_MODELO
from gd_esquema.Maestra
where AVION_IDENTIFICADOR is not null
group by AVION_IDENTIFICADOR, AVION_MODELO



insert into FELICES_PASCUAS.Tipo_Butaca
select row_number() over (order by (select NULL)), BUTACA_TIPO
from gd_esquema.Maestra
where BUTACA_TIPO is not null
group by BUTACA_TIPO



insert into FELICES_PASCUAS.Sucursal
select row_number() over (order by (select NULL)), SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO
from gd_esquema.Maestra
where SUCURSAL_DIR is not null and SUCURSAL_MAIL is not null and SUCURSAL_TELEFONO is not null
group by SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO



insert into FELICES_PASCUAS.Cliente
select row_number() over (order by (select NULL)), CLIENTE_DNI, CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_FECHA_NAC, CLIENTE_MAIL, CLIENTE_TELEFONO
from gd_esquema.Maestra
where CLIENTE_DNI is not null
group BY CLIENTE_DNI, CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_FECHA_NAC, CLIENTE_MAIL, CLIENTE_TELEFONO


insert into FELICES_PASCUAS.Hotel
select row_number() over (order by (select NULL)), HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS
from gd_esquema.Maestra
where HOTEL_CALLE is not null
group by HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS



insert into FELICES_PASCUAS.Tipo_Habitacion
select TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC
from gd_esquema.Maestra
where TIPO_HABITACION_CODIGO is not null
group by TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC



insert into FELICES_PASCUAS.Ruta_Aerea
select row_number() over (order by (select NULL)), RUTA_AEREA_CODIGO, c_orig.ciudad_codigo, c_dest.ciudad_codigo
from gd_esquema.Maestra
join FELICES_PASCUAS.Ciudad c_orig on RUTA_AEREA_CIU_ORIG = c_orig.ciudad_descripcion
join FELICES_PASCUAS.Ciudad c_dest on RUTA_AEREA_CIU_DEST = c_dest.ciudad_descripcion
group by RUTA_AEREA_CODIGO, c_orig.ciudad_codigo, c_dest.ciudad_codigo



insert into FELICES_PASCUAS.Vuelo
select m.VUELO_CODIGO, m.VUELO_FECHA_SALUDA, m.VUELO_FECHA_LLEGADA, ra.ruta_aerea_id, a.avion_identificador
from gd_esquema.Maestra m
join FELICES_PASCUAS.Ruta_Aerea ra on ra.ruta_aerea_codigo = m.RUTA_AEREA_CODIGO
join FELICES_PASCUAS.Ciudad c_orig on c_orig.ciudad_codigo = ra.ruta_aerea_ciu_orig and m.RUTA_AEREA_CIU_ORIG = c_orig.ciudad_descripcion
join FELICES_PASCUAS.Avion a on a.avion_identificador = m.AVION_IDENTIFICADOR and a.avion_modelo = m.AVION_MODELO
group by m.VUELO_CODIGO, m.VUELO_FECHA_SALUDA, m.VUELO_FECHA_LLEGADA, ra.ruta_aerea_id, a.avion_identificador



insert into FELICES_PASCUAS.Habitacion
select row_number() over (order by (select NULL)), h.hotel_id, th.tipo_habitacion_codigo, m.HABITACION_NUMERO, m.HABITACION_PISO, m.HABITACION_FRENTE, m.HABITACION_COSTO, m.HABITACION_PRECIO
from gd_esquema.Maestra m
join FELICES_PASCUAS.Hotel h on h.hotel_calle = m.HOTEL_CALLE and h.hotel_nro_calle = m.HOTEL_NRO_CALLE and h.hotel_cant_estrellas = m.HOTEL_CANTIDAD_ESTRELLAS
join FELICES_PASCUAS.Tipo_Habitacion th on th.tipo_habitacion_codigo = m.TIPO_HABITACION_CODIGO
group by h.hotel_id, m.HABITACION_NUMERO, m.HABITACION_PISO, m.HABITACION_FRENTE, th.tipo_habitacion_codigo, m.HABITACION_COSTO, m.HABITACION_PRECIO



insert into FELICES_PASCUAS.Butaca
select row_number() over (order by (select NULL)), m.BUTACA_NUMERO, tb.tipo_butaca_codigo, a.avion_identificador
from gd_esquema.Maestra m
join FELICES_PASCUAS.Avion a on a.avion_identificador = m.AVION_IDENTIFICADOR
join FELICES_PASCUAS.Tipo_Butaca tb on tb.tipo_butaca_descripcion = m.BUTACA_TIPO
group by m.BUTACA_NUMERO, tb.tipo_butaca_codigo, a.avion_identificador



insert into FELICES_PASCUAS.Factura
select m.FACTURA_NRO, s.sucursal_id, c.cliente_id, m.FACTURA_FECHA
from gd_esquema.Maestra m
join FELICES_PASCUAS.Sucursal s on s.sucursal_direccion = m.SUCURSAL_DIR and s.sucursal_mail = m.SUCURSAL_MAIL and s.sucursal_telefono = m.SUCURSAL_TELEFONO
join FELICES_PASCUAS.Cliente c on c.cliente_dni = m.CLIENTE_DNI and c.cliente_fecha_nacimiento = m.CLIENTE_FECHA_NAC
--join FELICES_PASCUAS.Cliente c on c.cliente_dni = m.CLIENTE_DNI and c.cliente_apellido = m.CLIENTE_APELLIDO
where m.FACTURA_NRO is not null
group by m.FACTURA_NRO, s.sucursal_id, c.cliente_id, m.FACTURA_FECHA
--acá el join con cliente podría ser por también por DNI + Apellido, tu join me da 237522 y el mío 237528, esto significa que hay
--más de un tipo con un dni + apellido iguales y solo un tipo con DNI + fecha de nacimiento. Habría que aclarar que
--select CLIENTE_DNI, CLIENTE_FECHA_NAC, count(*) from gd_esquema.Maestra
--where cliente_dni is not null
--group by CLIENTE_DNI, CLIENTE_FECHA_NAC
--having count(*) > 1
--no devuelve resultados y el otro sí

/*
Para mí es así: Si nosotros ejecutamos lo siguiente, nos va a dar todos los clientes con igual dni y apellido

select CLIENTE_DNI, CLIENTE_APELLIDO, count(*) from gd_esquema.Maestra
where cliente_dni is not null
group by CLIENTE_DNI, CLIENTE_APELLIDO
having count(*) > 1

dni			apell		count*
78749448	Bravo		2
60512110	Navarro		2
61452047	Palma		2

En la tabla maestra nos fijamos que factura_nro les corresponden a esos clientes:

select  *
from gd_esquema.Maestra
where cliente_dni in (78749448,60512110,61452047)

y verificas que efectivamente cada cliente tiene su propio nro de factura

fac_nro		clie_ap		clie_nom    clie_dni
60187926	Palma		ANACLARA	61452047
60195369	Palma		AKEEM		61452047
60199509	Bravo		ILANA		78749448
60204527	Navarro		MÍA			60512110
60287731	Bravo		ARAMI		78749448
60321274	Navarro		VIDAL		60512110


Si vos joineas de esta manera:

select m.FACTURA_NRO, s.sucursal_id, c.cliente_id, m.FACTURA_FECHA
from gd_esquema.Maestra m
join FELICES_PASCUAS.Sucursal s on s.sucursal_direccion = m.SUCURSAL_DIR and s.sucursal_mail = m.SUCURSAL_MAIL and s.sucursal_telefono = m.SUCURSAL_TELEFONO
join FELICES_PASCUAS.Cliente c on c.cliente_dni = m.CLIENTE_DNI and c.cliente_apellido = m.CLIENTE_APELLIDO
where m.FACTURA_NRO is not null
group by m.FACTURA_NRO, s.sucursal_id, c.cliente_id, m.FACTURA_FECHA

En esos casos te va a duplicar la atomicidad (por cada nro de factura va a detectar 2 clientes distintos, ya que tienen dni y apellido iguales)

fac_nro		fact_suc	clie_id		fact_fecha
60187926	4			144748		2018-02-25 00:00:00.000
60187926	4			144749		2018-02-25 00:00:00.000
60195369	2			144748		2018-02-05 00:00:00.000
60195369	2			144749		2018-02-05 00:00:00.000
60199509	1			186296		2018-05-14 00:00:00.000
60199509	1			186297		2018-05-14 00:00:00.000
60204527	2			142465		2018-03-30 00:00:00.000
60204527	2			142466		2018-03-30 00:00:00.000
60287731	3			186296		2018-06-04 00:00:00.000
60287731	3			186297		2018-06-04 00:00:00.000
60321274	2			142465		2018-02-28 00:00:00.000
60321274	2			142466		2018-02-28 00:00:00.000


En cambio, si vos joineas de esta manera:

select m.FACTURA_NRO, s.sucursal_id, c.cliente_id, m.FACTURA_FECHA
from gd_esquema.Maestra m
join FELICES_PASCUAS.Sucursal s on s.sucursal_direccion = m.SUCURSAL_DIR and s.sucursal_mail = m.SUCURSAL_MAIL and s.sucursal_telefono = m.SUCURSAL_TELEFONO
join FELICES_PASCUAS.Cliente c on c.cliente_dni = m.CLIENTE_DNI and c.cliente_fecha_nacimiento = m.CLIENTE_FECHA_NAC
where m.FACTURA_NRO is not null
group by m.FACTURA_NRO, s.sucursal_id, c.cliente_id, m.FACTURA_FECHA

La query te va a dar correctamente los datos ya que para una factura_nro no van a haber 2 clientes con dni y f_nac iguales

fac_nro		fact_suc	clie_id		fact_fecha
60187926	4			144749		2018-02-25 00:00:00.000
60195369	2			144748		2018-02-05 00:00:00.000
60199509	1			186297		2018-05-14 00:00:00.000
60204527	2			142465		2018-03-30 00:00:00.000
60287731	3			186296		2018-06-04 00:00:00.000
60321274	2			142466		2018-02-28 00:00:00.000

Y es justamente lo que coincide con los datos de la tabla maestra que está más arriba. Por eso la forma correcta para mí
es joinear cliente con dni y fecha_nac ya que nunca se va a repetir los clientes
*/



insert into FELICES_PASCUAS.Compra_Pasaje
select row_number() over (order by (select NULL)), COMPRA_FECHA, COMPRA_NUMERO
from gd_esquema.Maestra
where pasaje_codigo is not null
group by COMPRA_NUMERO, COMPRA_FECHA



insert into FELICES_PASCUAS.Compra_Estadia
select m.estadia_codigo, m.COMPRA_FECHA, m.COMPRA_NUMERO, m.ESTADIA_FECHA_INI, m.ESTADIA_CANTIDAD_NOCHES, e.empresa_id
from gd_esquema.Maestra m
join FELICES_PASCUAS.Empresa e on e.empresa_razon_social = m.EMPRESA_RAZON_SOCIAL
where m.ESTADIA_CODIGO is not null
group by m.estadia_codigo, m.COMPRA_FECHA, m.COMPRA_NUMERO, m.ESTADIA_CANTIDAD_NOCHES, m.ESTADIA_FECHA_INI, e.empresa_id
order by m.estadia_codigo, m.COMPRA_FECHA, m.COMPRA_NUMERO, m.ESTADIA_CANTIDAD_NOCHES, m.ESTADIA_FECHA_INI, e.empresa_id



insert into FELICES_PASCUAS.Estadia_Habitacion
select m.estadia_codigo, h.habitacion_id
from gd_esquema.Maestra m
join FELICES_PASCUAS.Hotel ho on ho.hotel_calle = m.HOTEL_CALLE and ho.hotel_nro_calle = m.HOTEL_NRO_CALLE
join FELICES_PASCUAS.Habitacion h on h.habitacion_numero = m.HABITACION_NUMERO and h.habitacion_hotel = ho.hotel_id
join FELICES_PASCUAS.Compra_Estadia ce on ce.estadia_codigo = m.estadia_codigo
group by m.estadia_codigo, h.habitacion_id
order by h.habitacion_id, m.estadia_codigo