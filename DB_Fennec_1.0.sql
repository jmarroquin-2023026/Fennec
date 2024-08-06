drop database if exists fennec;
create database Fennec;
use  fennec;
 
create table Carro (
    carroId int not null auto_increment,
    VIN int not null,
    marca VARCHAR(50) not null,
    modelo VARCHAR(50) not null,
    anio int not null,
    precio DECIMAL(10, 2) not null,
	primary key PK_carroId (carroId)
);

create table Cliente (
    clienteID INT PRIMARY KEY not null,
    nombre VARCHAR(50) not null,
    apellido VARCHAR(50)not null,
    direccion VARCHAR(100) not null,
    telefono VARCHAR(20)not null,
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
	codigoEmpleado int not null auto_increment,
    DPI varchar(13) not null,
    nombres varchar(50) not null,
    apellidos varchar(50),
    fechaNacimiento DATE,
    correo varchar(50) not null,
    telefono varchar(8) not null,
    usuario varchar(20) not null,
    imagen longblob,
    codigoTipoEmpleado INT not null,
    primary key PK_codigoEmpleado (codigoEmpleado),
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
    fechaEmision date not null,
    total decimal(10,2) not null,
    estado varchar(25) not null,
    observaciones varchar(50) not null,
    clienteID int not null,
    codigoEmpleado int not null,
    carroId int not null,
    primary key FacturaID (FacturaID),
    constraint PK_Factura_Cliente foreign key (clienteID)
	references Cliente (clienteID),
	constraint PK_Factura_Empleado foreign key (codigoEmpleado) 
	references Empleado (codigoEmpleado),
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
    transmision varchar(25),
    tipoLlantas varchar(50),
    color varchar(50),
    carroId int not null,
    Primary key PK_codigoDetalleCarro (codigoDetalleCarro),
    constraint FK_DetalleCarro_Carro foreign key (carroId)
		references Carro (carroId)
);

INSERT INTO TipoEmpleado (descripcion, salarioBase, bonificacion, turno)
VALUES ('Ejecutivo', 5000.00, 1000.00, 'Matutino');

INSERT INTO Empleado (DPI, Nombres, Apellidos, Correo, Telefono, usuario,codigoTipoEmpleado)
VALUES ('123', 'Juan', 'Pérez', 'juan.perez@example.com', '12345678','user', 1);

INSERT INTO Carro (VIN, marca, modelo, anio, precio) VALUES (123456789, 'Toyota', 'Corolla', 2020, 20000.00);
INSERT INTO DetalleCarro (codigoDetalleCarro, tipoCarro, puertas, transmision, tipoLlantas, color, carroId) 
VALUES (1, 'Sedán', 4, 'Automática', 'Radiales', 'Blanco', (SELECT carroId FROM Carro WHERE VIN = 123456789));


INSERT INTO Carro (VIN, marca, modelo, anio, precio) VALUES (123456789, 'Toyota', 'Corolla', 2020, 20000.00);

INSERT INTO Cliente (clienteID, nombre, apellido, direccion , telefono, correo) VALUES (1,'Juan', 'Pérez', 'Calle Falsa 123', '5551234', 'juan.perez@example.com');

INSERT INTO Proveedor (nombresProveedor, apellidosProveedor, direccionProveedor, telefonoProveedor, correoProveedor, observacionesProveedor) 
VALUES ('Proveedor', 'Ejemplo', 'Avenida Principal 456', '12345678', 'proveedor@example.com', 'Observaciones');


INSERT INTO Compra (fecha, descripcion, totalDocumento, estado) 
VALUES ('2024-08-02', 'Compra de ejemplo', 1000.00, 'Completada');

INSERT INTO DetalleCompra (costoUnitario, cantidad, observaciones, tipoDePago, carroId, codigoCompra, codigoProveedor) 
VALUES (20000.00, 1, 'Observaciones', 'Efectivo', 1, 1, 1);

INSERT INTO Factura (facturaID, fechaEmision, total, estado, observaciones, clienteID, codigoEmpleado, carroId) 
VALUES (1, '2024-08-02', 20000.00, 'Pagada', 'Sin observaciones', 1, 1, 1);

INSERT INTO DetalleFactura (detalleFacturaID, cantidad, precioUnitario, subTotal, descuento, facturaID) 
VALUES (1, 1, 20000.00, 20000.00, 0.00, 1);


select * from Empleado;
Select * From Carro where carroId = 1;


select * from DetalleCarro where codigoDetalleCarro=1;

Update TipoEmpleado set descripcion = 'a', salarioBase = 100, bonificacion = 4, turno = 'a' where codigoTipoEmpleado = 1;