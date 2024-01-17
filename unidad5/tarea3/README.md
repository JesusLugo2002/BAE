# Tarea-trabajo con funciones


<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

<div align=justify>

## Paso 1 - Creación de una base de datos a partir de un .sql

Para esta actividad, ya se nos dispone el siguiente fichero .sql como base para crear la base de datos:

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
```

Esto se puede lograr de varias formas pero, en mi caso, utilicé el comando `nano empleados-db.sql` para crear el fichero y, posteriormente, importarlo en *Sqlite3* con:

```sh
sqlite3 tareas3.db < empleados-db.sql
```

Otra de las formas que se puede hacer es, creando el fichero .db previamente y dentro de el mismo usar el comando `.read empleados-db.sql`.

## Paso 2 - Realización de consultas

Se deben realizar distintas consultas en la base de datos haciendo uso de funciones:

- Funciones UPPER y LOWER:
  - Muestra el nombre de todos los empleados en mayúsculas.

```sql
select UPPER(nombre) as mayus_nombre from empleados;
```
<div align=center>
┌──────────────┐
│ mayus_nombre │
├──────────────┤
│ JUAN         │
│ MARíA        │
│ CARLOS       │
│ ANA          │
│ PEDRO        │
│ LAURA        │
│ JAVIER       │
│ CARMEN       │
│ MIGUEL       │
│ ELENA        │
│ DIEGO        │
│ SOFíA        │
│ ANDRéS       │
│ ISABEL       │
│ RAúL         │
│ PATRICIA     │
│ ALEJANDRO    │
│ NATALIA      │
│ ROBERTO      │
│ BEATRIZ      │
└──────────────┘
</div>

- Funciones Numéricas:
  - Calcula el valor absoluto del salario de todos los empleados.
- Funciones de Fecha y Hora:
  - Muestra la fecha actual.
- Funciones de Agregación:
  - Calcula el promedio de salarios de todos los empleados.
  - Convierte la cadena '123' a un valor entero.
- Funciones de Manipulación de Cadenas:
  - Concatena el nombre y el departamento de cada empleado.
- Funciones de Manipulación de Cadenas (CONCAT_WS):
  - Concatena el nombre y el departamento de cada empleado con un guion como separador.
- Funciones de Control de Flujo (CASE):
  - Categoriza a los empleados según sus salarios.
- Funciones de Agregación (SUM):
  - Calcula la suma total de salarios de todos los empleados.
- Funciones Numéricas (ROUND):
  - Redondea el salario de todos los empleados a dos decimales.
- Funciones de Manipulación de Cadenas (LENGTH):
  - Muestra la longitud de cada nombre de empleado.
- Funciones de Agregación (COUNT):
  - Cuenta el número total de empleados en cada departamento.
- Funciones de Fecha y Hora (CURRENT_TIME):
  - Muestra la hora actual.
- Funciones de Conversión (CAST):
  - Convierte el salario a un valor de punto flotante.
- Funciones de Manipulación de Cadenas (SUBSTR):
  - Muestra los primeros tres caracteres de cada nombre de empleado.

</div>