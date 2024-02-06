# Ejercicios de subconsultas (expresiones regulares y funciones matemáticas)

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Consultas

#### 1. Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
```sql
select cl.nombre, cl.edad from clientes as cl, ventas as v, coches as co where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.marca = 'Toyota';
```
|   nombre   | edad |
|------------|------|
| Juan Pérez | 30   |


#### 2. Consulta para calcular el precio promedio de los coches vendidos.
```sql
select round(avg(co.precio), 2) as precio_promedio from coches as co, ventas as v where co.id_coche = v.id_coche;
```
| precio_promedio |
|-----------------|
| 28777.78        |

#### 3. Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
```sql
select co.modelo, co.marca from coches as co, ventas as v, clientes as cl where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad < 30;
```
|     modelo     |   marca   |
|----------------|-----------|
| Hatchback 2021 | Honda     |
| Coupé 2022     | Chevrolet |
| Híbrido 2022   | Hyundai   |
| Eléctrico 2021 | Tesla     |


#### 4. Consulta para contar el número de coches vendidos de cada marca.
```sql
select co.marca, count(co.id_coche) as coches_vendidos from coches as co, ventas as v where co.id_coche = v.id_coche group by co.marca;
```
|   marca    | coches_vendidos |
|------------|-----------------|
| Chevrolet  | 1               |
| Ford       | 1               |
| Honda      | 1               |
| Hyundai    | 1               |
| Mazda      | 1               |
| Nissan     | 1               |
| Tesla      | 1               |
| Toyota     | 1               |
| Volkswagen | 1               |

#### 5. Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
```sql

```

#### 6. Consulta para calcular el total gastado en reparaciones por cada cliente.
#### 7. Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
#### 8. Consulta para calcular el precio medio de los coches vendidos en 2023.
#### 9. Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
#### 10. Consulta para contar el número de coches vendidos por año.
#### 11. Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
#### 12. Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
#### 13. Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
#### 14. Consulta para contar el número de coches vendidos por cliente.
#### 15. Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
#### 16. Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
#### 17. Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
#### 18. Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
#### 19. Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".
#### 20. Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
