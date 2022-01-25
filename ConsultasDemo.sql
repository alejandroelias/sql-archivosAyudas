use Demo;

-- Select
select * from ARTICULOS;
select * from DEPARTAMENTOS;
select * from CLIENTES;
select * from FACTURAS;
select * from FACTURAS_DETALLE;
select * from USUARIOS;

-- Data
insert into ARTICULOS values ('CAFE', 5);
insert into DEPARTAMENTOS values ('SV-AH','Ahuachapán');
insert into USUARIOS values('sa','123','admin','1');


-- Atributos
SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('dbo.CLIENTES');
SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('dbo.ARTICULOS')
SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('dbo.FACTURAS');
SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('dbo.FACTURAS_DETALLE');




--Create
create database Demo;

use Demo;
go


create table ARTICULOS(
	id_articulo int identity(1,1) primary key,
	descripcion nvarchar(50),
	existencia int
	);

create table DEPARTAMENTOS(
	id_depart int identity(1,1) primary key,
	codigo nvarchar(50),
	descripcion nvarchar(50)
	);

create table CLIENTES(
	id_cliente int identity(1,1) primary key,
	fk_id_depart int foreign key references DEPARTAMENTOS(id_depart),
	nombre nvarchar(50),
	direccion nvarchar(50),
	departamento nvarchar(50),
	condicion_pago nvarchar(20),
	dias_credito int,
	num_registro nvarchar(50),
	num_nit nvarchar(50),
	giro nvarchar(50)
	);


create table FACTURAS(	
	id_factura int identity(1,1) primary key,
	fk_id_cliente int foreign key references CLIENTES(id_cliente),
	clientes_nombre nvarchar(50),
	clientes_direccion nvarchar(50),
	clientes_departamento nvarchar(50),
	clientes_registro nvarchar(50),
	clientes_num_nit nvarchar(50),
	clientes_giro nvarchar(50),
	subtotal decimal(18,2),
	iva decimal(18,2),
	total decimal(18,2),
	total_letras nvarchar(50)
	);
	

create table FACTURAS_DETALLE(
	id_factura_detalle int identity(1,1) primary key,
	fk_id_factura int foreign key references FACTURAS(id_factura),
	fk_id_articulo int foreign key references ARTICULOS(id_articulo),
	articulos_descripcion nvarchar(50),
	cantidad int,
	precio_unitario decimal(18,2),
	subtotal decimal(18,2)
	);


create table USUARIOS(
	id_usuario int identity(1,1) primary key,
	nombre nvarchar(50),
	contrasena nvarchar(200), 	--TODO: nvarchar de ser de 200
	rol nvarchar(20),
	nivel_acceso nvarchar(20)
	);
