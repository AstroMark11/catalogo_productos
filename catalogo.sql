-- Crear la base de datos catalogoproductos
create database catalogoproductos;

use catalogoproductos;

-- Crear tabla productos
create table productos (
    producto_id int primary key auto_increment,
    nombre_producto varchar(50),
    categoría varchar(50),
    precio decimal(10, 2),
    descripción text,
    cantidad_en_existencia int,
    estado enum ('disponible', 'agotado', 'descontinuado'),
    fecha_creación timestamp default current_timestamp,
    fecha_actualización timestamp default current_timestamp 
);

-- Crear tabla categorías
create table categorias (
    categoría_id int primary key auto_increment,
    nombre_categoría varchar(50) not null,
    descripción text
);

-- Crear tabla proveedores
create table proveedores (
    proveedor_id int primary key auto_increment,
    nombre_provedor varchar(50) not null,
    dirección varchar(50),
    teléfono varchar(50),
    correo varchar(50)
);

-- Crear tabla clientes
create table clientes (
    cliente_id int primary key auto_increment,
    nombre varchar(50) not null,
    direccion varchar(100),
    telefono varchar(20),
    email VARCHAR(50)
);

-- Crear tabla ordenes
create table ordenes (
    orden_id int primary key auto_increment,
    cliente_id int,
    fecha_orden timestamp default current_timestamp,
    estado enum('pendiente', 'enviado', 'entregado', 'cancelado'),
    total decimal(10, 2),
    foreign key (cliente_id) references clientes(cliente_id)
);

-- Crear tabla detalle_ordenes
create table detalle_ordenes (
    detalle_orden_id int primary key auto_increment,
    orden_id int,
    producto_id int,
    cantidad int,
    precio decimal(10, 2),
    foreign key (orden_id) references ordenes(orden_id),
    foreign key (producto_id) references productos(producto_id)
);

-- Crear tabla inventarios
create table inventario (
    inventario_id int primary key auto_increment,
    producto_id int,
    cantidad int,
    fecha_actualizacion timestamp default current_timestamp on update current_timestamp,
    foreign key (producto_id) references productos(producto_id)
);

-- Crear tabla vendedores
create table vendedores (
    vendedor_id int primary key auto_increment,
    nombre_vendedor varchar(100) not null,
    salario decimal(10, 2),
    fecha_contratación date
);

-- Productos puede tener una clave foránea que referencia a categorias:
alter table productos
add column categoría_id int,
add foreign key (categoría_id) references categorias(categoría_id);

-- Productos puede tener una clave foránea que referencia a proveedores:
alter table productos
add column proveedor_id int,
add foreign key (proveedor_id) references proveedores(proveedor_id);

-- Insertar datosen la tabla productos
insert into productos (nombre_producto, categoría, precio, descripción, cantidad_en_existencia)
values ('laptop Dell', 'computadoras', 950.00, 'gamer', 50),
       ('Impresora Brother', 'impresoras', 350.00, 'multifuncional', 28),
       ('Iphone 15', 'telefónos inteligentes', 1500.00, 'Iphone MAX', 18),
       ('Reloj Garmin', 'relojes inteligentes', 450.00, 'Reloj multifuncional', 60);
