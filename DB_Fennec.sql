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
    nombres VARCHAR(50) not null,
    apellidos VARCHAR(50) not null,
    fechaNacimiento DATE not null,
    correo varchar(50) not null,
    telefono varchar(8) not null,
    usuario varchar(20) not null,
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

create table DetalleCompra (
	codigoDetalleCompra int not null auto_increment,
    costoUnitario decimal(10,2) default 0 not null,
    cantidad int not null,
    observaciones varchar(150) not null,
    tipoDePago varchar(50) not null,
    carroId int not null,
    codigoCompra int not null,
    codigoProveedor int not null,
    Primary key PK_codigoDetalleCompra (codigoDetalleCompra),
    constraint FK_DetalleCompra_Carro foreign key (carroId) 
		references Carro (carroId),
	constraint FK_DetalleCompra_Compra foreign key (codigoCompra) 
		references Compra (codigoCompra),
	constraint FK_DetalleCompra_Proveedor foreign key (codigoProveedor) 
		references Proveedor (codigoProveedor)
);

create table Factura (
    facturaID int not null,
    fechaEmisión date not null,
    total decimal(10,2) not null,
    estado varchar(25) not null,
    observaciones varchar(50) not null,
    clienteID int not null,
    DPI int not null,
    carroId int not null,
    primary key FacturaID (FacturaID),
    constraint PK_Factura_Cliente foreign key (clienteID)
	references Cliente (clienteID),
	constraint PK_Factura_Empleado foreign key (DPI) 
	references Empleado (DPI),
	constraint FK_Factura_Carro foreign key(carroId) 
		references Carro(carroId)
 
);

create table DetalleFactura (
    detalleFacturaID int primary key,
    cantidad int,
    precioUnitario decimal(10, 2),
    subTotal decimal(10, 2),
    descuento decimal(10, 2),
    facturaID int,
    foreign key (FacturaID) references Factura(FacturaID)
);
 
Create table DetalleCarro(
	codigoDetalleCarro int not null,
    tipoCarro varchar(25) not null,
    puertas int not null,
    transimsion varchar(25),
    tipoLlantas varchar(50),
    color varchar(50),
    carroId int not null,
    Primary key PK_codigoDetalleCarro (codigoDetalleCarro),
    constraint FK_DetalleCarro_Carro foreign key (carroId)
		references Carro (carroId)
);
