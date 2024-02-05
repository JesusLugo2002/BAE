-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?
select co.id_coche, co.marca, co.modelo, co.precio, cl.id_cliente, cl.nombre as nombre_cliente from coches as co, clientes as cl, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente;

/**
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
*

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)


-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas
select modelo, precio from coches where id_coche not in (select id_coche from ventas); 

/**
|   modelo    | precio  |
|-------------|---------|
| Pickup 2022 | 31000.0 |
**/

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

select sum(co.precio) as total_gastado from coches as co, ventas as v where co.id_coche = v.id_coche;

/**
| total_gastado |
|---------------|
| 259000.0      |
**/

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?



-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
