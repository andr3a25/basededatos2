create table tienda(

    id  int(11) auto_increment  not null,
    fecha  varchar(30) not null,
    precio  decimal(30) not null,
    descripcion text(40) not null,
    CONSTRAINT pk_tienda PRIMARY KEY(id)
);
