-- ING EN SISTEMAS COMPUTACIONALES
--    UNIVERSIDAD DE GUANAJUATO
--    CAMPUS IRAPUATO SALAMANCA
--     DIVISION DE INGENIERIAS
--         MARIO DÍAZ RAMOS

-- Base de datos para la empresa de tecnología 
-- HOLO-FANS VENTILADORES POV 3D  

-- Crear la base de datos
CREATE DATABASE HOLO_DB;
USE HOLO_DB;

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    EmpleadoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Puesto ENUM('Ingeniero', 'Técnico', 'Gerente', 'Vendedor', 'Operario'),
    Salario DECIMAL(10,2),
    FechaContratacion DATE,
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Tabla de Departamentos
CREATE TABLE Departamentos (
    DepartamentoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion ENUM('Producción', 'Ventas', 'Marketing', 'I+D', 'Recursos Humanos', 'Soporte Técnico', 'Finanzas', 'Logística', 'Seguridad')
);

-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Categoria ENUM('Ventilador 3D', 'Accesorios', 'Refacciones'),
    Precio DECIMAL(10,2),
    Stock INT,
    ProveedorID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Tabla de Proyectos
CREATE TABLE Proyectos (
    ProyectoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tipo ENUM('Desarrollo', 'Investigación', 'Mejora Continua'),
    FechaInicio DATE,
    FechaFin DATE,
    Presupuesto DECIMAL(10,2),
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Tabla de Ventas
CREATE TABLE Ventas (
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    ClienteID INT,
    EmpleadoID INT,
    Total DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de DetalleVentas
CREATE TABLE DetalleVentas (
    DetalleID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Compras
CREATE TABLE Compras (
    CompraID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    ProveedorID INT,
    Total DECIMAL(10,2),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Tabla de DetalleCompras
CREATE TABLE DetalleCompras (
    DetalleID INT AUTO_INCREMENT PRIMARY KEY,
    CompraID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (CompraID) REFERENCES Compras(CompraID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Inventario
CREATE TABLE Inventario (
    InventarioID INT AUTO_INCREMENT PRIMARY KEY,
    ProductoID INT,
    StockActual INT,
    Ubicacion ENUM('Almacén Principal', 'Almacén Secundario', 'Producción'),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Mantenimiento
CREATE TABLE Mantenimiento (
    MantenimientoID INT AUTO_INCREMENT PRIMARY KEY,
    MaquinaID INT,
    Fecha DATE,
    Tipo ENUM('Preventivo', 'Correctivo'),
    EmpleadoID INT,
    FOREIGN KEY (MaquinaID) REFERENCES Maquinas(MaquinaID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de Maquinas
CREATE TABLE Maquinas (
    MaquinaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tipo ENUM('CNC', 'Impresora 3D', 'Torno', 'Fresadora'),
    FechaCompra DATE,
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Tabla de Soporte Técnico
CREATE TABLE SoporteTecnico (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    EmpleadoID INT,
    FechaApertura DATE,
    FechaCierre DATE,
    Asunto ENUM('Instalación', 'Configuración', 'Reparación', 'Consultoría'),
    Estado ENUM('Abierto', 'En Proceso', 'Cerrado'),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de Control de Calidad
CREATE TABLE ControlCalidad (
    ControlID INT AUTO_INCREMENT PRIMARY KEY,
    ProductoID INT,
    FechaInspeccion DATE,
    Resultado ENUM('Aceptado', 'Rechazado'),
    EmpleadoID INT,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de Seguridad
CREATE TABLE Seguridad (
    EventoID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Tipo ENUM('Incidente', 'Accidente'),
    MedidasTomadas ENUM('Reporte', 'Reparación', 'Sanción'),
    EmpleadoID INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de Finanzas
CREATE TABLE Finanzas (
    TransaccionID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Monto DECIMAL(10,2),
    Tipo ENUM('Ingreso', 'Egreso'),
    Concepto ENUM('Venta', 'Compra', 'Salario', 'Mantenimiento', 'Otro')
);

-- Tabla de Capacitaciones
CREATE TABLE Capacitaciones (
    CapacitacionID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tipo ENUM('Inducción', 'Actualización', 'Especialización'),
    FechaInicio DATE,
    FechaFin DATE
);

-- Tabla de Logística
CREATE TABLE Logistica (
    EnvioID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT,
    FechaEnvio DATE,
    FechaEntrega DATE,
    EstadoEnvio ENUM('Pendiente', 'En Tránsito', 'Entregado', 'Devuelto'),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID)
);
