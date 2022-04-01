SELECT * FROM `tienda`.`cliente` LIMIT 1000;
SELECT * FROM `tienda`.`producto` LIMIT 1000;

create database tienda;


use tienda;
create table producto (cod int(30) auto_increment not null primary key, nom_produc varchar(30), descripcion varchar(45) not null);


insert into producto values (not null, "arroz", "cereal");

insert into producto values (not null, "yogurt", "lacteo");


create table cliente (id int (30) auto_increment not null primary key, nombre varchar (30) not null, apellido varchar (30) not null);


insert into cliente values (not null, "juana", "rodriguez");

insert into cliente values (not null, "felipe", "rios");

