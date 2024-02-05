# Ejercicios de consultas con regexp y funciones

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Consultas

#### 1. Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.

```sql
select co.marca, co.modelo, co.precio, cl.nombre as nombre_cliente from coches as co, clientes as cl, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente;
```
| id_coche |   marca    |     modelo     | precio  | id_cliente | nombre_cliente  |
|----------|------------|----------------|---------|------------|-----------------|
| 1        | Toyota     | Sedán 2022     | 25000.0 | 1          | Juan Pérez      |
| 2        | Honda      | Hatchback 2021 | 22000.0 | 2          | María Gómez     |
| 3        | Ford       | SUV 2023       | 30000.0 | 3          | Carlos López    |
| 4        | Chevrolet  | Coupé 2022     | 28000.0 | 4          | Ana Martínez    |
| 5        | Nissan     | Camioneta 2023 | 32000.0 | 5          | Pedro Rodríguez |
| 6        | Volkswagen | Compacto 2021  | 20000.0 | 6          | Laura Sánchez   |
| 7        | Hyundai    | Híbrido 2022   | 27000.0 | 7          | Miguel González |
| 8        | Mazda      | Deportivo 2023 | 35000.0 | 8          | Isabel Díaz     |
| 10       | Tesla      | Eléctrico 2021 | 40000.0 | 10         | Elena Torres    |

#### 2. Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.

```sql

```

#### 3. Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

```sql
select modelo, precio from coches where id_coche not in (select id_coche from ventas); 
```
|   modelo    | precio  |
|-------------|---------|
| Pickup 2022 | 31000.0 |


#### 4. Calcular el total gastado por todos los clientes en coches:

```sql
select sum(co.precio) as total_gastado from coches as co, ventas as v where co.id_coche = v.id_coche;
```
| total_gastado |
|---------------|
| 259000.0      |

#### 5. Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:

```sql
select co.*, cl.nombre as nombre_cliente, v.fecha_venta from coches as co, clientes as cl, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente order by fecha_venta desc;
```
| id_coche |     modelo     |   marca    | año  | precio  | nombre_cliente  | fecha_venta |
|----------|----------------|------------|------|---------|-----------------|-------------|
| 10       | Eléctrico 2021 | Tesla      | 2021 | 40000.0 | Elena Torres    | 2023-10-05  |
| 8        | Deportivo 2023 | Mazda      | 2023 | 35000.0 | Isabel Díaz     | 2023-08-25  |
| 7        | Híbrido 2022   | Hyundai    | 2022 | 27000.0 | Miguel González | 2023-07-20  |
| 6        | Compacto 2021  | Volkswagen | 2021 | 20000.0 | Laura Sánchez   | 2023-06-15  |
| 5        | Camioneta 2023 | Nissan     | 2023 | 32000.0 | Pedro Rodríguez | 2023-05-05  |
| 4        | Coupé 2022     | Chevrolet  | 2022 | 28000.0 | Ana Martínez    | 2023-04-10  |
| 3        | SUV 2023       | Ford       | 2023 | 30000.0 | Carlos López    | 2023-03-25  |
| 2        | Hatchback 2021 | Honda      | 2021 | 22000.0 | María Gómez     | 2023-02-20  |
| 1        | Sedán 2022     | Toyota     | 2022 | 25000.0 | Juan Pérez      | 2023-01-15  |


#### 6. Encontrar el modelo de coche más caro.

```sql
select marca, modelo, max(precio) as precio_máximo from coches;
```
| marca |     modelo     | precio_máximo |
|-------|----------------|---------------|
| Tesla | Eléctrico 2021 | 40000.0       |

#### 7. Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.

```sql

```

#### 8. Encontrar los clientes que han comprado coches de la marca 'Toyota':

```sql
select * from clientes where id_cliente
```

#### 9. Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.

```sql

```

#### 10. Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.

```sql

```

#### 11. Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.

```sql

```

#### 12. Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.

```sql

```

#### 13. Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:

```sql

```
