drop database if exists fennec;
create database Fennec;
use  fennec;
 
 
create table Carro (
    carroId int not null auto_increment,
    VIN int not null,
    Marca VARCHAR(50) not null,
    Modelo VARCHAR(50) not null,
    Año int not null,
    Precio DECIMAL(10, 2) not null,
	primary key PK_carroId (carroId)
);

create table Cliente (
    clienteID INT PRIMARY KEY not null,
    Nombre VARCHAR(50) not null,
    Apellido VARCHAR(50)not null,
    Dirección VARCHAR(100) not null,
    Teléfono VARCHAR(20)not null,
    Correo varchar(50) not null
);