<div align=justify>

## Paso 1.1 - Crear la base de datos
La base de datos llamada **tarea1** se crea con:
```bash
sqlite3 tarea1.db
``` 

## Paso 1.2 - Crear la tabla 'Ejemplo'

Ahora creamos la primera tabla llamada **Ejemplo** con:
```sql
create table Ejemplo (
    id integer not null primary key autoincrement,
    texto text,
    entero integer,
    decimal real,
    fecha date,
    booleano boolean
);
```
## Paso 2 - Inserción de los 50 registros en la tabla

Dado que el proceso es largo, se resumirá lo realizado mostrando únicamente los primeros y últimos dos registros:

```sql
insert into Ejemplo (texto, entero, decimal, fecha, booleano) values ('Ejemplo1', '25', '10.5', '2022-05-15', '0');
insert into Ejemplo (texto, entero, decimal, fecha, booleano) values ('Ejemplo2', '63', '45.7', '2022-06-22', '1');

...

insert into Ejemplo (texto, entero, decimal, fecha, booleano) values ('Ejemplo49', '28', '50.0', '2026-05-25', '0');
insert into Ejemplo (texto, entero, decimal, fecha, booleano) values ('Ejemplo50', '75', '85.3', '2026-06-11', '1');
```

</div>