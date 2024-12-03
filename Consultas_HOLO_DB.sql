-- 1. Mostrar todos los clientes
SELECT * FROM Clientes;

-- 2. Consultar productos en stock con más de 50 unidades
SELECT Nombre, Stock 
FROM Productos 
WHERE Stock > 50;

-- 3. Consultar las ventas realizadas con detalles del cliente y total de la venta
SELECT Ventas.VentaID, Ventas.Fecha, Clientes.Nombre AS Cliente, Ventas.Total 
FROM Ventas
INNER JOIN Clientes ON Ventas.ClienteID = Clientes.ClienteID;

-- 4. Ver los detalles de una venta específica (Productos vendidos)
SELECT Ventas.VentaID, Productos.Nombre AS Producto, DetalleVentas.Cantidad, DetalleVentas.PrecioUnitario
FROM DetalleVentas
INNER JOIN Ventas ON DetalleVentas.VentaID = Ventas.VentaID
INNER JOIN Productos ON DetalleVentas.ProductoID = Productos.ProductoID
WHERE Ventas.VentaID = 1;

-- 5. Consultar empleados por departamento
SELECT Empleados.Nombre AS Empleado, Departamentos.Nombre AS Departamento
FROM Empleados
INNER JOIN Departamentos ON Empleados.DepartamentoID = Departamentos.DepartamentoID
ORDER BY Departamento;

-- 6. Consultar las compras realizadas con detalles del proveedor
SELECT Compras.CompraID, Compras.Fecha, Proveedores.Nombre AS Proveedor, Compras.Total
FROM Compras
INNER JOIN Proveedores ON Compras.ProveedorID = Proveedores.ProveedorID;

-- 7. Mostrar los productos que han sido inspeccionados en Control de Calidad y sus resultados
SELECT Productos.Nombre AS Producto, ControlCalidad.FechaInspeccion, ControlCalidad.Resultado
FROM ControlCalidad
INNER JOIN Productos ON ControlCalidad.ProductoID = Productos.ProductoID;

-- 8. Mostrar el historial de mantenimiento de las máquinas
SELECT Maquinas.Nombre AS Maquina, Mantenimiento.Fecha, Mantenimiento.Tipo, Empleados.Nombre AS Empleado
FROM Mantenimiento
INNER JOIN Maquinas ON Mantenimiento.MaquinaID = Maquinas.MaquinaID
INNER JOIN Empleados ON Mantenimiento.EmpleadoID = Empleados.EmpleadoID;

-- 9. Consultar los proyectos en curso junto con su departamento
SELECT Proyectos.Nombre AS Proyecto, Proyectos.Tipo, Proyectos.FechaInicio, Proyectos.FechaFin, Departamentos.Nombre AS Departamento
FROM Proyectos
INNER JOIN Departamentos ON Proyectos.DepartamentoID = Departamentos.DepartamentoID
WHERE Proyectos.FechaFin > CURDATE();

-- 10. Consultar los incidentes registrados en Seguridad con los empleados involucrados
SELECT Seguridad.Fecha, Seguridad.Tipo, Seguridad.MedidasTomadas, Empleados.Nombre AS Empleado
FROM Seguridad
INNER JOIN Empleados ON Seguridad.EmpleadoID = Empleados.EmpleadoID;

-- 11. Consultar la logística de envíos en curso (pendientes de entrega)
SELECT Logistica.EnvioID, Ventas.VentaID, Clientes.Nombre AS Cliente, Logistica.EstadoEnvio, Logistica.FechaEnvio
FROM Logistica
INNER JOIN Ventas ON Logistica.VentaID = Ventas.VentaID
INNER JOIN Clientes ON Ventas.ClienteID = Clientes.ClienteID
WHERE Logistica.EstadoEnvio IN ('Pendiente', 'En Tránsito');

-- 12. Obtener las ganancias totales por mes (Ingresos - Egresos)
SELECT DATE_FORMAT(Fecha, '%Y-%m') AS Mes, 
    SUM(CASE WHEN Tipo = 'Ingreso' THEN Monto ELSE 0 END) AS TotalIngresos,
    SUM(CASE WHEN Tipo = 'Egreso' THEN Monto ELSE 0 END) AS TotalEgresos,
    SUM(CASE WHEN Tipo = 'Ingreso' THEN Monto ELSE 0 END) - SUM(CASE WHEN Tipo = 'Egreso' THEN Monto ELSE 0 END) AS Ganancia
FROM Finanzas
GROUP BY Mes;

-- 13. Consultar los empleados con los salarios más altos
SELECT Nombre, Puesto, Salario 
FROM Empleados 
ORDER BY Salario DESC 
LIMIT 5;

-- 14. Actualizar el estado de un ticket de soporte técnico
UPDATE SoporteTecnico
SET Estado = 'Cerrado', FechaCierre = CURDATE()
WHERE TicketID = 2;

-- 15. Eliminar registros antiguos de logística (más de 1 año)
DELETE FROM Logistica
WHERE FechaEnvio < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
