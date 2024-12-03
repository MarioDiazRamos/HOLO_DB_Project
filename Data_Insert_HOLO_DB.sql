-- ING EN SISTEMAS COMPUTACIONALES
--    UNIVERSIDAD DE GUANAJUATO
--    CAMPUS IRAPUATO SALAMANCA
--     DIVISION DE INGENIERIAS
--         MARIO DÍAZ RAMOS

-- Datos de prueba para la base de datos HOLO_DB
USE HOLO_DB;

-- Insertar datos en la tabla Departamentos
INSERT INTO Departamentos (Nombre, Descripcion) VALUES
('Producción', 'Producción'),
('Ventas', 'Ventas'),
('Marketing', 'Marketing'),
('I+D', 'I+D'),
('Recursos Humanos', 'Recursos Humanos'),
('Soporte Técnico', 'Soporte Técnico'),
('Finanzas', 'Finanzas'),
('Logística', 'Logística'),
('Seguridad', 'Seguridad');

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) VALUES
('Carlos Gómez', 'Av. Juárez 120, Salamanca, Guanajuato', '464-123-4567', 'carlos.gomez@example.com'),
('Ana Martínez', 'Calle Hidalgo 45, Irapuato, Guanajuato', '462-987-6543', 'ana.martinez@example.com'),
('Luis Torres', 'Blvd. Díaz Ordaz 200, León, Guanajuato', '477-567-8901', 'luis.torres@example.com');

-- Insertar datos en la tabla Proveedores
INSERT INTO Proveedores (Nombre, Direccion, Telefono, Email) VALUES
('Tech Distribuidores', 'Parque Industrial 33, Querétaro, Querétaro', '442-123-4567', 'contacto@techdistribuidores.com'),
('Soluciones Innovadoras', 'Av. Independencia 100, México, CDMX', '555-987-6543', 'ventas@solucionesinnovadoras.mx');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (Nombre, Puesto, Salario, FechaContratacion, DepartamentoID) VALUES
('Miguel Hernández', 'Ingeniero', 25000.00, '2023-01-15', 4), -- I+D
('Sofía Pérez', 'Técnico', 18000.00, '2023-03-01', 6), -- Soporte Técnico
('Juan López', 'Gerente', 30000.00, '2022-06-10', 1), -- Producción
('Laura Rivera', 'Vendedor', 15000.00, '2023-07-05', 2), -- Ventas
('Pedro Vargas', 'Operario', 12000.00, '2023-04-20', 1); -- Producción

-- Insertar datos en la tabla Productos
INSERT INTO Productos (Nombre, Categoria, Precio, Stock, ProveedorID) VALUES
('Ventilador Holo 3D Series 1', 'Ventilador 3D', 1999.99, 100, 1),
('Kit de Instalación Premium', 'Accesorios', 499.99, 50, 1),
('Aspa Repuesto 3D', 'Refacciones', 199.99, 200, 2);

-- Insertar datos en la tabla Proyectos
INSERT INTO Proyectos (Nombre, Tipo, FechaInicio, FechaFin, Presupuesto, DepartamentoID) VALUES
('Desarrollo HoloFan 2.0', 'Desarrollo', '2023-01-01', '2023-12-31', 500000.00, 4),
('Investigación Nuevas Tecnologías', 'Investigación', '2023-06-01', '2024-06-01', 300000.00, 4);

-- Insertar datos en la tabla Ventas
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Total) VALUES
('2023-10-01', 1, 4, 2499.98),
('2023-10-15', 2, 4, 1999.99);

-- Insertar datos en la tabla DetalleVentas
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario) VALUES
(1, 1, 1, 1999.99),
(1, 2, 1, 499.99),
(2, 1, 1, 1999.99);

-- Insertar datos en la tabla Compras
INSERT INTO Compras (Fecha, ProveedorID, Total) VALUES
('2023-09-10', 1, 99999.50),
('2023-09-15', 2, 39999.80);

-- Insertar datos en la tabla DetalleCompras
INSERT INTO DetalleCompras (CompraID, ProductoID, Cantidad, PrecioUnitario) VALUES
(1, 1, 50, 1999.99),
(2, 3, 200, 199.99);

-- Insertar datos en la tabla Inventario
INSERT INTO Inventario (ProductoID, StockActual, Ubicacion) VALUES
(1, 100, 'Almacén Principal'),
(2, 50, 'Almacén Principal'),
(3, 200, 'Producción');

-- Insertar datos en la tabla Maquinas
INSERT INTO Maquinas (Nombre, Tipo, FechaCompra, DepartamentoID) VALUES
('Torno MX-400', 'Torno', '2023-01-10', 1),
('Impresora 3D ProMax', 'Impresora 3D', '2023-03-15', 1);

-- Insertar datos en la tabla Mantenimiento
INSERT INTO Mantenimiento (MaquinaID, Fecha, Tipo, EmpleadoID) VALUES
(1, '2023-05-20', 'Preventivo', 5),
(2, '2023-06-10', 'Correctivo', 5);

-- Insertar datos en la tabla Soporte Técnico
INSERT INTO SoporteTecnico (ClienteID, EmpleadoID, FechaApertura, FechaCierre, Asunto, Estado) VALUES
(1, 2, '2023-10-05', '2023-10-06', 'Instalación', 'Cerrado'),
(2, 2, '2023-10-15', NULL, 'Configuración', 'En Proceso');

-- Insertar datos en la tabla Control de Calidad
INSERT INTO ControlCalidad (ProductoID, FechaInspeccion, Resultado, EmpleadoID) VALUES
(1, '2023-09-01', 'Aceptado', 3),
(2, '2023-09-02', 'Aceptado', 3);

-- Insertar datos en la tabla Seguridad
INSERT INTO Seguridad (Fecha, Tipo, MedidasTomadas, EmpleadoID) VALUES
('2023-08-20', 'Incidente', 'Reporte', 5),
('2023-09-10', 'Accidente', 'Reparación', 5);

-- Insertar datos en la tabla Finanzas
INSERT INTO Finanzas (Fecha, Monto, Tipo, Concepto) VALUES
('2023-10-01', 2499.98, 'Ingreso', 'Venta'),
('2023-09-10', 99999.50, 'Egreso', 'Compra');

-- Insertar datos en la tabla Capacitaciones
INSERT INTO Capacitaciones (Nombre, Tipo, FechaInicio, FechaFin) VALUES
('Inducción a Nuevas Tecnologías', 'Inducción', '2023-01-10', '2023-01-15'),
('Actualización en Normas de Seguridad', 'Actualización', '2023-07-01', '2023-07-05');

-- Insertar datos en la tabla Logística
INSERT INTO Logistica (VentaID, FechaEnvio, FechaEntrega, EstadoEnvio) VALUES
(1, '2023-10-02', '2023-10-05', 'Entregado'),
(2, '2023-10-16', NULL, 'En Tránsito');
