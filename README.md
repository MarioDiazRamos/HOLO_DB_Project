# HOLO_DB_Project
HOLO_DB es el sistema de administración de datos para HOLO-FANS, una empresa de ventiladores holográficos 3D. Incluye scripts SQL para crear la base de datos, insertar datos de prueba y ejecutar consultas. Gestiona clientes, ventas, inventario, mantenimiento, soporte y más. Proyecto académico de Mario Díaz Ramos.

# HOLO_DB - Sistema de Administración de Datos para HOLO-FANS

**Autor**: Mario Díaz Ramos  
**Universidad de Guanajuato, Campus Irapuato-Salamanca**

## Descripción

Este proyecto consiste en el desarrollo de un sistema de administración de datos para la empresa **HOLO-FANS**, dedicada a la fabricación de ventiladores holográficos 3D basados en tecnología POV (Persistencia de la Visión). El sistema gestiona datos clave relacionados con clientes, ventas, inventario, soporte técnico, mantenimiento de máquinas y más.

## Archivos Incluidos

- **`HOLO_DB.sql`**: Script para crear la base de datos HOLO_DB.
- **`Data_Insert.sql`**: Script para insertar datos de prueba en la base de datos.
- **`consultas_HOLO_DB.sql`**: Script con diversas consultas SQL para interactuar con la base de datos.
- **`README.md`**: Instrucciones sobre cómo ejecutar el proyecto.

## Instrucciones de Uso

1. **Descarga los scripts SQL del repositorio**.

2. **Configurar la Base de Datos**:
- Abre tu gestor de base de datos (MySQL Workbench, phpMyAdmin, etc.).
- Ejecuta el script `HOLO_DB.sql` para crear la base de datos HOLO_DB.
- Luego, ejecuta `Data_Insert.sql` para insertar datos de prueba en las tablas correspondientes.

3. **Consultar la Base de Datos**:
- Una vez cargados los datos, puedes ejecutar el script `consultas_HOLO_DB.sql` para realizar diversas consultas y explorar la funcionalidad del sistema.

## Consultas Disponibles

El archivo `consultas_HOLO_DB.sql` contiene las siguientes consultas:
- Consultar todos los clientes.
- Consultar productos en stock.
- Consultar ventas realizadas con detalles de clientes.
- Ver los empleados por departamento.
- Consultar el historial de mantenimiento de las máquinas, entre otras.

## Tecnologías Utilizadas

- **MySQL**: Base de datos relacional.
- **SQL**: Lenguaje para la creación y consulta de la base de datos.

---

**Proyecto académico desarrollado como parte de la asignatura Sistemas de Administración de Datos en la Universidad de Guanajuato.**

