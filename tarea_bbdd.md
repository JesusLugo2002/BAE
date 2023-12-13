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