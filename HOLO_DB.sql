-- ING EN SISTEMAS COMPUTACIONALES
--    UNIVERSIDAD DE GUANAJUATO
--    CAMPUS IRAPUATO SALAMANCA
--     DIVISION DE INGENIERIAS
--         MARIO DÍAZ RAMOS

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS HOLO_DB;
USE HOLO_DB;

-- Crear tablas en orden correcto

-- Tabla de Departamentos (referenciada por Empleados y Maquinas)
CREATE TABLE IF NOT EXISTS Departamentos (
    DepartamentoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion ENUM('Producción', 'Ventas', 'Marketing', 'I+D', 'Recursos Humanos', 'Soporte Técnico', 'Finanzas', 'Logística', 'Seguridad')
);

-- Tabla de Proveedores
CREATE TABLE IF NOT EXISTS Proveedores (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

-- Tabla de Empleados (depende de Departamentos)
CREATE TABLE IF NOT EXISTS Empleados (
    EmpleadoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Puesto ENUM('Ingeniero', 'Técnico', 'Gerente', 'Vendedor', 'Operario'),
    Salario DECIMAL(10,2),
    FechaContratacion DATE,
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Tabla de Productos (depende de Proveedores)
CREATE TABLE IF NOT EXISTS Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Categoria ENUM('Ventilador 3D', 'Accesorios', 'Refacciones'),
    Precio DECIMAL(10,2),
    Stock INT,
    ProveedorID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Tabla de Maquinas (depende de Departamentos)
CREATE TABLE IF NOT EXISTS Maquinas (
    MaquinaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tipo ENUM('CNC', 'Impresora 3D', 'Torno', 'Fresadora'),
    FechaCompra DATE,
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Tabla de Proyectos (depende de Departamentos)
CREATE TABLE IF NOT EXISTS Proyectos (
    ProyectoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tipo ENUM('Desarrollo', 'Investigación', 'Mejora Continua'),
    FechaInicio DATE,
    FechaFin DATE,
    Presupuesto DECIMAL(10,2),
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Tabla de Ventas (depende de Clientes y Empleados)
CREATE TABLE IF NOT EXISTS Ventas (
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    ClienteID INT,
    EmpleadoID INT,
    Total DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de DetalleVentas (depende de Ventas y Productos)
CREATE TABLE IF NOT EXISTS DetalleVentas (
    DetalleID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Compras (depende de Proveedores)
CREATE TABLE IF NOT EXISTS Compras (
    CompraID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    ProveedorID INT,
    Total DECIMAL(10,2),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Tabla de DetalleCompras (depende de Compras y Productos)
CREATE TABLE IF NOT EXISTS DetalleCompras (
    DetalleID INT AUTO_INCREMENT PRIMARY KEY,
    CompraID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (CompraID) REFERENCES Compras(CompraID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Inventario (depende de Productos)
CREATE TABLE IF NOT EXISTS Inventario (
    InventarioID INT AUTO_INCREMENT PRIMARY KEY,
    ProductoID INT,
    StockActual INT,
    Ubicacion ENUM('Almacén Principal', 'Almacén Secundario', 'Producción'),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Mantenimiento (depende de Maquinas y Empleados)
CREATE TABLE IF NOT EXISTS Mantenimiento (
    MantenimientoID INT AUTO_INCREMENT PRIMARY KEY,
    MaquinaID INT,
    Fecha DATE,
    Tipo ENUM('Preventivo', 'Correctivo'),
    EmpleadoID INT,
    FOREIGN KEY (MaquinaID) REFERENCES Maquinas(MaquinaID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de Soporte Técnico (depende de Clientes y Empleados)
CREATE TABLE IF NOT EXISTS SoporteTecnico (
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

-- Tabla de Control de Calidad (depende de Productos y Empleados)
CREATE TABLE IF NOT EXISTS ControlCalidad (
    ControlID INT AUTO_INCREMENT PRIMARY KEY,
    ProductoID INT,
    FechaInspeccion DATE,
    Resultado ENUM('Aceptado', 'Rechazado'),
    EmpleadoID INT,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de Seguridad (depende de Empleados)
CREATE TABLE IF NOT EXISTS Seguridad (
    EventoID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Tipo ENUM('Incidente', 'Accidente'),
    MedidasTomadas ENUM('Reporte', 'Reparación', 'Sanción'),
    EmpleadoID INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla de Finanzas
CREATE TABLE IF NOT EXISTS Finanzas (
    TransaccionID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Monto DECIMAL(10,2),
    Tipo ENUM('Ingreso', 'Egreso'),
    Concepto ENUM('Venta', 'Compra', 'Salario', 'Mantenimiento', 'Otro')
);

-- Tabla de Capacitaciones
CREATE TABLE IF NOT EXISTS Capacitaciones (
    CapacitacionID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tipo ENUM('Inducción', 'Actualización', 'Especialización'),
    FechaInicio DATE,
    FechaFin DATE
);

-- Tabla de Logística (depende de Ventas)
CREATE TABLE IF NOT EXISTS Logistica (
    EnvioID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT,
    FechaEnvio DATE,
    FechaEntrega DATE,
    EstadoEnvio ENUM('Pendiente', 'En Tránsito', 'Entregado', 'Devuelto'),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID)
);
