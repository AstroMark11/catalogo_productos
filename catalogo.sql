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
