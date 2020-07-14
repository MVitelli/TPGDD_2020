USE GD1C2020;
GO

/* Eliminación de los objetos preexistentes */

------------ Eliminación de tablas    ------------------
IF OBJECT_ID('FELICES_PASCUAS.H_Venta_Estadia','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.H_Venta_Estadia;

IF OBJECT_ID('FELICES_PASCUAS.H_Venta_Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.H_Venta_Pasaje;

IF OBJECT_ID('FELICES_PASCUAS.D_Cliente','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Cliente;

IF OBJECT_ID('FELICES_PASCUAS.D_Sucursal','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Sucursal;

IF OBJECT_ID('FELICES_PASCUAS.D_Proveedor','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Proveedor;

IF OBJECT_ID('FELICES_PASCUAS.D_Ruta','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Ruta;

IF OBJECT_ID('FELICES_PASCUAS.D_Tipo_Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Tipo_Pasaje;

IF OBJECT_ID('FELICES_PASCUAS.D_Avion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Avion;

IF OBJECT_ID('FELICES_PASCUAS.D_Tipo_Habitacion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Tipo_Habitacion;

IF OBJECT_ID('FELICES_PASCUAS.D_Hotel','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.D_Hotel;

IF OBJECT_ID('FELICES_PASCUAS.V_Ganancia_Total_Estadias','V') IS NOT NULL
	DROP VIEW FELICES_PASCUAS.V_Ganancia_Total_Estadias;

IF OBJECT_ID('FELICES_PASCUAS.V_Camas_Vendidas_Marzo_2018','V') IS NOT NULL
	DROP VIEW FELICES_PASCUAS.V_Camas_Vendidas_Marzo_2018;

IF OBJECT_ID('FELICES_PASCUAS.V_Cantidad_Pasajes_Ejecutiva','V') IS NOT NULL
	DROP VIEW FELICES_PASCUAS.V_Cantidad_Pasajes_Ejecutiva;

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

create table FELICES_PASCUAS.D_Ruta(
	ruta_id decimal(18,0) not null,
	ruta_ciu_orig decimal(18,0) not null,
	ruta_ciu_orig_descrip nvarchar(255) not null,
	ruta_ciu_dest decimal(18,0) not null,
	ruta_ciu_dest_descrip nvarchar(255) not null
);

create table FELICES_PASCUAS.D_Tipo_Pasaje(
	tipo_pasaje_id decimal(18,0) not null,
	tipo_pasaje_descripcion nvarchar(255)
);

create table FELICES_PASCUAS.D_Avion(
	avion_id nvarchar(50) not null,
	avion_modelo nvarchar(50)
);

create table FELICES_PASCUAS.D_Tipo_Habitacion(
	tipo_habitacion_id decimal(18,0) not null,
	tipo_habitacion_desc nvarchar(50) not null,
	tipo_habitacion_cantidad_camas int default 0
);

create table FELICES_PASCUAS.D_Hotel(
	hotel_id decimal(18,0) not null,
	hotel_calle nvarchar(50),
	hotel_nro_calle decimal(18,0),
	hotel_cant_estrellas decimal (18,0)
);

create table FELICES_PASCUAS.H_Venta_Estadia(
	h_v_estadia_anio int not null,
	h_v_estadia_mes int not null,
	h_v_estadia_cliente decimal(18,0) not null,
	h_v_estadia_proveedor decimal(18,0) not null,
	h_v_estadia_sucursal decimal(18,0) not null,
	h_v_estadia_tipo_habitacion decimal(18,0) not null,
	h_v_estadia_hotel decimal(18,0) not null,
	h_v_estadia_precio_compra decimal(18,2), 
	h_v_estadia_precio_venta decimal(18,2),
	h_v_estadia_ganancia decimal(18,2),
	h_v_estadia_cant_habit_vendidas int default 0,
	h_v_estadia_cant_camas_vendidas int default 0
);

create table FELICES_PASCUAS.H_Venta_Pasaje(
	h_v_pasaje_anio int not null,
	h_v_pasaje_mes int not null,
	h_v_pasaje_cliente decimal(18,0) not null,
	h_v_pasaje_proveedor decimal(18,0) not null,
	h_v_pasaje_sucursal decimal(18,0) not null,
	h_v_pasaje_avion nvarchar(50) not null,
	h_v_pasaje_tipo_pasaje decimal(18,0) not null,
	h_v_pasaje_ruta decimal(18,0) not null,
	h_v_pasaje_precio_compra decimal(18,2), 
	h_v_pasaje_precio_venta decimal(18,2),
	h_v_pasaje_ganancia decimal(18,2),
	h_v_pasaje_cant_vendidos int default 0
);
-------------------- Creación de primary keys ---------------------------

ALTER TABLE FELICES_PASCUAS.D_Cliente 
ADD CONSTRAINT PK_D_Cliente PRIMARY KEY (cliente_id);

ALTER TABLE FELICES_PASCUAS.D_Sucursal 
ADD CONSTRAINT PK_D_Sucursal PRIMARY KEY (sucursal_id);

ALTER TABLE FELICES_PASCUAS.D_Proveedor 
ADD CONSTRAINT PK_D_Proveedor PRIMARY KEY (proveedor_id);

ALTER TABLE FELICES_PASCUAS.D_Ruta
ADD CONSTRAINT PK_D_Ruta PRIMARY KEY (ruta_id);

ALTER TABLE FELICES_PASCUAS.D_Tipo_Pasaje
ADD CONSTRAINT PK_D_Tipo_Pasaje PRIMARY KEY (tipo_pasaje_id);

ALTER TABLE FELICES_PASCUAS.D_Avion
ADD CONSTRAINT PK_D_Avion PRIMARY KEY (avion_id);

ALTER TABLE FELICES_PASCUAS.D_Tipo_Habitacion
ADD CONSTRAINT PK_D_Tipo_Habitacion PRIMARY KEY (tipo_habitacion_id);

ALTER TABLE FELICES_PASCUAS.D_Hotel
ADD CONSTRAINT PK_D_Hotel PRIMARY KEY (hotel_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Estadia
ADD CONSTRAINT PK_H_Venta_Estadia PRIMARY KEY 
(
	h_v_estadia_anio,
	h_v_estadia_mes, 
	h_v_estadia_cliente,
	h_v_estadia_proveedor,
	h_v_estadia_sucursal,
	h_v_estadia_tipo_habitacion,
	h_v_estadia_hotel
);

ALTER TABLE FELICES_PASCUAS.H_Venta_Pasaje
ADD CONSTRAINT PK_H_Venta_Pasaje PRIMARY KEY 
(
	h_v_pasaje_anio,
	h_v_pasaje_mes, 
	h_v_pasaje_cliente,
	h_v_pasaje_proveedor,
	h_v_pasaje_sucursal,
	h_v_pasaje_avion,
	h_v_pasaje_tipo_pasaje,
	h_v_pasaje_ruta
);

-------------------- Creación de foreign keys ---------------------------
--H_Venta_Estadia
ALTER TABLE FELICES_PASCUAS.H_Venta_Estadia ADD CONSTRAINT FK_H_V_Estadia_Cliente 
FOREIGN KEY (h_v_estadia_cliente) REFERENCES FELICES_PASCUAS.D_Cliente(cliente_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Estadia ADD CONSTRAINT FK_H_V_Estadia_Proveedor 
FOREIGN KEY (h_v_estadia_proveedor) REFERENCES FELICES_PASCUAS.D_Proveedor(proveedor_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Estadia ADD CONSTRAINT FK_H_V_Estadia_Sucursal 
FOREIGN KEY (h_v_estadia_sucursal) REFERENCES FELICES_PASCUAS.D_Sucursal(sucursal_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Estadia ADD CONSTRAINT FK_H_V_Estadia_Tipo_Habitacion 
FOREIGN KEY (h_v_estadia_tipo_habitacion) REFERENCES FELICES_PASCUAS.D_Tipo_Habitacion(tipo_habitacion_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Estadia ADD CONSTRAINT FK_H_V_Estadia_Hotel 
FOREIGN KEY (h_v_estadia_hotel) REFERENCES FELICES_PASCUAS.D_Hotel(hotel_id);

--H_Venta_Pasaje
ALTER TABLE FELICES_PASCUAS.H_Venta_Pasaje ADD CONSTRAINT FK_H_V_Pasaje_Cliente 
FOREIGN KEY (h_v_pasaje_cliente) REFERENCES FELICES_PASCUAS.D_Cliente(cliente_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Pasaje ADD CONSTRAINT FK_H_V_Pasaje_Proveedor 
FOREIGN KEY (h_v_pasaje_proveedor) REFERENCES FELICES_PASCUAS.D_Proveedor(proveedor_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Pasaje ADD CONSTRAINT FK_H_V_Pasaje_Sucursal 
FOREIGN KEY (h_v_pasaje_sucursal) REFERENCES FELICES_PASCUAS.D_Sucursal(sucursal_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Pasaje ADD CONSTRAINT FK_H_V_Pasaje_Avion 
FOREIGN KEY (h_v_pasaje_avion) REFERENCES FELICES_PASCUAS.D_Avion(avion_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Pasaje ADD CONSTRAINT FK_H_V_Pasaje_Tipo_Pasaje 
FOREIGN KEY (h_v_pasaje_tipo_pasaje) REFERENCES FELICES_PASCUAS.D_Tipo_Pasaje(tipo_pasaje_id);

ALTER TABLE FELICES_PASCUAS.H_Venta_Pasaje ADD CONSTRAINT FK_H_V_Pasaje_Ruta
FOREIGN KEY (h_v_pasaje_ruta) REFERENCES FELICES_PASCUAS.D_Ruta(ruta_id);

-------------------- Migración de tablas OLTP a tablas OLAP  --------------------

--Ruta
insert into FELICES_PASCUAS.D_Ruta
	select r.ruta_aerea_id, c.ciudad_codigo, c.ciudad_descripcion, c2.ciudad_codigo, c2.ciudad_descripcion from FELICES_PASCUAS.Ruta_Aerea r
		join FELICES_PASCUAS.Ciudad c on c.ciudad_codigo = r.ruta_aerea_ciu_orig
		join FELICES_PASCUAS.Ciudad c2 on c2.ciudad_codigo = r.ruta_aerea_ciu_dest 



--Avion
insert into FELICES_PASCUAS.D_Avion
	select * from FELICES_PASCUAS.Avion



--Cliente
insert into FELICES_PASCUAS.D_Cliente
	select cliente_id, cliente_dni, cliente_apellido, cliente_nombre,(YEAR(GETDATE()) - YEAR(cliente_fecha_nacimiento)), cliente_mail, cliente_telefono
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
	set tipo_habitacion_cantidad_camas = 1 where tipo_habitacion_desc= 'Base Simple'
update FELICES_PASCUAS.D_Tipo_Habitacion
	set tipo_habitacion_cantidad_camas = 2 where tipo_habitacion_desc= 'Base Doble'
update FELICES_PASCUAS.D_Tipo_Habitacion
	set tipo_habitacion_cantidad_camas = 3 where tipo_habitacion_desc= 'Base Triple'
update FELICES_PASCUAS.D_Tipo_Habitacion
	set tipo_habitacion_cantidad_camas = 4 where tipo_habitacion_desc= 'Base Cuadruple'
update FELICES_PASCUAS.D_Tipo_Habitacion
	set tipo_habitacion_cantidad_camas = 4 where tipo_habitacion_desc= 'King'



--Hotel
insert into FELICES_PASCUAS.D_Hotel
	select * from FELICES_PASCUAS.Hotel



--H_Venta_Pasaje
insert into FELICES_PASCUAS.H_Venta_Pasaje
	select YEAR(f.factura_fecha), MONTH(f.factura_fecha), f.factura_cliente, p.pasaje_empresa, f.factura_sucursal, v.vuelo_avion,b.butaca_tipo, v.vuelo_ruta_aerea, 
		SUM(p.pasaje_costo),
		SUM(p.pasaje_precio) + SUM(vp.venta_pasaje_cargo_extra),
		SUM(p.pasaje_precio) + SUM(vp.venta_pasaje_cargo_extra) - SUM(p.pasaje_costo),
		COUNT(*)
	from FELICES_PASCUAS.Pasaje p
		join FELICES_PASCUAS.Venta_Pasaje vp on vp.venta_pasaje_id = p.pasaje_venta
		join FELICES_PASCUAS.Factura f on f.factura_nro = vp.venta_pasaje_factura
		join FELICES_PASCUAS.Vuelo v on v.vuelo_codigo = p.pasaje_vuelo
		join FELICES_PASCUAS.Butaca b on b.butaca_id = p.pasaje_butaca
	group by YEAR(f.factura_fecha), MONTH(f.factura_fecha), f.factura_cliente, p.pasaje_empresa, f.factura_sucursal, v.vuelo_avion,b.butaca_tipo, v.vuelo_ruta_aerea--, venta_pasaje_id
	order by YEAR(f.factura_fecha), MONTH(f.factura_fecha), f.factura_cliente desc  



--H_Venta_Estadia
insert into FELICES_PASCUAS.H_Venta_Estadia
	select YEAR(f.factura_fecha), MONTH(f.factura_fecha), f.factura_cliente, ce.estadia_empresa, f.factura_sucursal, h.habitacion_tipo, h.habitacion_hotel,
		SUM(h.habitacion_costo),
		SUM(h.habitacion_precio) + SUM(ve.venta_estadia_cargo_extra),
		SUM(h.habitacion_precio) + SUM(ve.venta_estadia_cargo_extra) - SUM(h.habitacion_costo),
		COUNT(h.habitacion_id),
		SUM(dth.tipo_habitacion_cantidad_camas)
	from FELICES_PASCUAS.Habitacion h
		join FELICES_PASCUAS.Venta_Estadia_Habitacion veh on veh.habitacion_id = h.habitacion_id
		join FELICES_PASCUAS.Venta_Estadia ve on ve.venta_estadia_id = veh.venta_estadia_id
		join FELICES_PASCUAS.Factura f on f.factura_nro = ve.venta_estadia_factura
		join FELICES_PASCUAS.Estadia_Habitacion eh on eh.habitacion_id = h.habitacion_id
		join FELICES_PASCUAS.Compra_Estadia ce on ce.estadia_codigo = eh.estadia_codigo and eh.habitacion_id = h.habitacion_id
		join FELICES_PASCUAS.D_Tipo_Habitacion dth on h.habitacion_tipo = dth.tipo_habitacion_id
	group by YEAR(f.factura_fecha), MONTH(f.factura_fecha), f.factura_cliente,  ce.estadia_empresa, f.factura_sucursal, h.habitacion_tipo, h.habitacion_hotel
	order by YEAR(f.factura_fecha), MONTH(f.factura_fecha), f.factura_cliente desc


GO

---Views de ejemplo
---Consulta por ganancia total de estadías

CREATE VIEW FELICES_PASCUAS.V_Ganancia_Total_Estadias AS
	select SUM(hve.h_v_estadia_ganancia) as ganancia_estadia from FELICES_PASCUAS.H_Venta_Estadia hve
go		
---Consulta por cantidad de camas vendidas en el mes de marzo 2018
CREATE VIEW FELICES_PASCUAS.V_Camas_Vendidas_Marzo_2018 AS
	select SUM(hve.h_v_estadia_cant_camas_vendidas) as camas_vendidas from FELICES_PASCUAS.H_Venta_Estadia hve
		where hve.h_v_estadia_anio = 2018 and hve.h_v_estadia_mes = 3
go
---Consulta por cantidad de pasajes vendidos de clase 'Ejecutiva'
CREATE VIEW FELICES_PASCUAS.V_Cantidad_Pasajes_Ejecutiva AS
	select SUM(hvp.h_v_pasaje_cant_vendidos) as cant_pasajes_ejecutiva from FELICES_PASCUAS.H_Venta_Pasaje hvp
		join FELICES_PASCUAS.D_Tipo_Pasaje dtp on dtp.tipo_pasaje_id = hvp.h_v_pasaje_tipo_pasaje
		where dtp.tipo_pasaje_descripcion = 'Ejecutiva'
go