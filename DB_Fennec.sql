drop database if exists fennec;
create database Fennec;
use  fennec;
 
 
create table Carro (
    carroId int not null auto_increment,
    VIN int not null,
    marca VARCHAR(50) not null,
    modelo VARCHAR(50) not null,
    año int not null,
    precio DECIMAL(10, 2) not null,
	primary key PK_carroId (carroId)
);

create table Cliente (
    clienteID INT PRIMARY KEY not null,
    nombre VARCHAR(50) not null,
    apellido VARCHAR(50)not null,
    airección VARCHAR(100) not null,
    teléfono VARCHAR(20)not null,
    correo varchar(50) not null
);

create table Proveedor(
    codigoProveedor int not null auto_increment,
    nombresProveedor varchar(50) not null,
    apellidosProveedor varchar(50) not null,
    direccionProveedor varchar(200) not null,
    telefonoProveedor varchar(8) not null,
    correoProveedor varchar(50) not null,
    observacionesProveedor varchar(150) not null,
    Primary key PK_CodigoProveedor (codigoProveedor)
);

create table TipoEmpleado (
    codigoTipoEmpleado int not null auto_increment,
    descripcion varchar(50),
    salarioBase decimal(10, 2),
    bonificacion decimal(10,2),
    turno varchar(15),
    Primary Key PK_CodigoTipoEmpleado (codigoTipoEmpleado)
);

create table Empleado (
    DPI INT PRIMARY KEY not null,
    Nombres VARCHAR(50) not null,
    Apellidos VARCHAR(50) not null,
    FechaNacimiento DATE not null,
    Correo varchar(50) not null,
    Telefono varchar(8) not null,
    codigoTipoEmpleado INT not null,
    FOREIGN KEY (codigoTipoEmpleado) REFERENCES TipoEmpleado(codigoTipoEmpleado)
);

create table Compra (
    codigoCompra int not null auto_increment,
    fecha date not null,
    descripcion varchar(50) not null,
    totalDocumento decimal(10,2) default 0,
    estado varchar (25) not null,
    primary key PK_codigoCompra (codigoCompra)
);