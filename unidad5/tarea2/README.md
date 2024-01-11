# Tarea-creación de bases de datos

<div align=justify>

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Paso 1 - Creación de la base de datos y sus tablas

1. Creamos la base de datos con el siguiente comando:
```sh
sqlite3 tarea2.db
```

2. Estando dentro del fichero .db, creamos las tablas **Propietarios** y **Vehiculos** con lo siguiente:
```sql
-- Tabla "Propietarios"
CREATE TABLE Propietarios (
id integer primary key autoincrement,
nombre text not null,
apellido text not null,
dni text unique);

-- Tabla "Vehiculos"
CREATE TABLE Vehiculos (
id integer primary key autoincrement,
marca text not null,
modelo text not null,
anio integer not null,
id_propietario integer references Propietarios(id));
```

## Paso 2 - Inserción de datos

Tras haber creado las tablas, seguiremos con la inserción de información en las mismas; a continuación unos ejemplos resumidos de las inserciones de ambas tablas:

### Tabla "Propietarios"

Cabe aclarar que en los parámetros de *Values* no se escribe la id, pues este registro se crea automáticamente por el atributo de *autoincrement* que le fue asignado previamente en la creación de la tabla:

```sql
INSERT INTO Propietarios(nombre, apellido, dni) VALUES('Juan','Perez','12345678A');         -- # 1
INSERT INTO Propietarios(nombre, apellido, dni) VALUES('Maria','Lopez','87654321B');        -- # 2
INSERT INTO Propietarios(nombre, apellido, dni) VALUES('Carlos','Ruiz','11111111C');        -- # 3
-- ...
INSERT INTO Propietarios(nombre, apellido, dni) VALUES('Clara','Soto','16161616R');         -- # 18
INSERT INTO Propietarios(nombre, apellido, dni) VALUES('Sergio','Mendoza','17171717S');     -- # 19
INSERT INTO Propietarios(nombre, apellido, dni) VALUES('Patricia','Navarro','18181818T');   -- # 20
```

### Tabla "Vehiculos"

Al igual que con la tabla **Propietarios**, no se asigna el valor *id* en el *Insert*, pues es autoincremental; en cambio, se debe asignar la *foreign key* de *id_propietario* para que haya una referencia con la tabla que corresponde:

```sql
INSERT INTO Vehiculos(marca, modelo, anio, id_propietario) VALUES('Ford','Fiesta',2019,1);
INSERT INTO Vehiculos(marca, modelo, anio, id_propietario) VALUES('Toyota','Corolla',2018,2);
INSERT INTO Vehiculos(marca, modelo, anio, id_propietario) VALUES('Nissan','Sentra',2020,3);
-- ...
INSERT INTO Vehiculos(marca, modelo, anio, id_propietario) VALUES('Toyota','Highlander',2020,18);
INSERT INTO Vehiculos(marca, modelo, anio, id_propietario) VALUES('Honda','Odyssey',2016,19);
INSERT INTO Vehiculos(marca, modelo, anio, id_propietario) VALUES('Nissan','Murano',2019,20);
```

## Paso 3 - Consultas de datos

</div>