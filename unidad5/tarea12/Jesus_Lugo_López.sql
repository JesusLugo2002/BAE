-- Consultas sobre una tabla

-- Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedido order by fecha;

/*
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
└────┴─────────┴────────────┴────────────┴──────────────┘
*/

-- Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedido order by total desc limit 2;

/*
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
*/

-- Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select distinct c.id as id_cliente from cliente as c join pedido as p on c.id = p.id_cliente;

/*
┌────────────┐
│ id_cliente │
├────────────┤
│ 5          │
│ 1          │
│ 2          │
│ 8          │
│ 7          │
│ 4          │
│ 3          │
│ 6          │
└────────────┘
*/

-- Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
select * from pedido where fecha regexp '2017' and total > 500;

/*
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴─────────┴────────────┴────────────┴──────────────┘
*/

-- Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
select nombre, apellido1 || ' ' || apellido2 as apellidos from comercial where categoria between 0.05 and 0.11;

/*
┌─────────┬────────────────┐
│ nombre  │   apellidos    │
├─────────┼────────────────┤
│ Diego   │ Flores Salas   │
│ Antonio │ Vega Hernández │
│ Alfredo │ Ruiz Flores    │
└─────────┴────────────────┘
*/

-- Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
select max(categoria) as max_comision from comercial;

/*
┌──────────────┐
│ max_comision │
├──────────────┤
│ 0.15         │
└──────────────┘
*/

-- Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select id, nombre, apellido1 from cliente where apellido2 is null order by apellido1, nombre;

/*
┌────┬────────┬───────────┐
│ id │ nombre │ apellido1 │
├────┼────────┼───────────┤
│ 7  │ Pilar  │ Ruiz      │
│ 4  │ Adrián │ Suárez    │
└────┴────────┴───────────┘
*/

-- Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
select nombre from cliente where nombre regexp '^A.*n$' order by nombre;

/*
┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adrián │
└────────┘
*/

-- Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
select nombre from cliente where nombre not regexp '^A' order by nombre;

/*
┌───────────┐
│  nombre   │
├───────────┤
│ Daniel    │
│ Guillermo │
│ Marcos    │
│ María     │
│ Pepe      │
│ Pilar     │
└───────────┘
*/

-- Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
select distinct nombre from comercial where nombre regexp 'o$';

/*
┌─────────┐
│ nombre  │
├─────────┤
│ Diego   │
│ Antonio │
│ Alfredo │
└─────────┘
*/

-- Consultas multitabla
-- Nota: Resuelva todas las consultas utilizando las cláusulas INNER JOIN.

-- Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select distinct c.id, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos from cliente as c join pedido as p on c.id = p.id_cliente order by nombre;

/*
┌────┬────────┬────────────────┐
│ id │ nombre │   apellidos    │
├────┼────────┼────────────────┤
│ 1  │ Aarón  │ Rivero Gómez   │
│ 2  │ Adela  │ Salas Díaz     │
│ 3  │ Adolfo │ Rubio Flores   │
│ 4  │ Adrián │ Suárez         │
│ 5  │ Marcos │ Loyola Méndez  │
│ 6  │ María  │ Santana Moreno │
│ 8  │ Pepe   │ Ruiz Santana   │
│ 7  │ Pilar  │ Ruiz           │
└────┴────────┴────────────────┘
*/

-- Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
select p.id_cliente, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos, c.ciudad as ciudad, c.categoria, p.id as id_pedido, p.id_comercial, p.fecha as fecha_pedido, p.total from pedido as p join cliente as c on p.id_cliente = c.id order by c.nombre;

/*
┌────────────┬────────┬────────────────┬─────────┬───────────┬───────────┬──────────────┬──────────────┬─────────┐
│ id_cliente │ nombre │   apellidos    │ ciudad  │ categoria │ id_pedido │ id_comercial │ fecha_pedido │  total  │
├────────────┼────────┼────────────────┼─────────┼───────────┼───────────┼──────────────┼──────────────┼─────────┤
│ 1          │ Aarón  │ Rivero Gómez   │ Almería │ 100       │ 2         │ 5            │ 2016-09-10   │ 270.65  │
│ 1          │ Aarón  │ Rivero Gómez   │ Almería │ 100       │ 15        │ 5            │ 2019-03-11   │ 370.85  │
│ 1          │ Aarón  │ Rivero Gómez   │ Almería │ 100       │ 16        │ 5            │ 2019-03-11   │ 2389.23 │
│ 2          │ Adela  │ Salas Díaz     │ Granada │ 200       │ 3         │ 1            │ 2017-10-05   │ 65.26   │
│ 2          │ Adela  │ Salas Díaz     │ Granada │ 200       │ 7         │ 1            │ 2015-09-10   │ 5760.0  │
│ 2          │ Adela  │ Salas Díaz     │ Granada │ 200       │ 12        │ 1            │ 2017-04-25   │ 3045.6  │
│ 3          │ Adolfo │ Rubio Flores   │ Sevilla │           │ 11        │ 7            │ 2016-08-17   │ 75.29   │
│ 4          │ Adrián │ Suárez         │ Jaén    │ 300       │ 8         │ 6            │ 2017-10-10   │ 1983.43 │
│ 5          │ Marcos │ Loyola Méndez  │ Almería │ 200       │ 1         │ 2            │ 2017-10-05   │ 150.5   │
│ 5          │ Marcos │ Loyola Méndez  │ Almería │ 200       │ 5         │ 2            │ 2017-09-10   │ 948.5   │
│ 6          │ María  │ Santana Moreno │ Cádiz   │ 100       │ 13        │ 1            │ 2019-01-25   │ 545.75  │
│ 6          │ María  │ Santana Moreno │ Cádiz   │ 100       │ 14        │ 1            │ 2017-02-02   │ 145.82  │
│ 8          │ Pepe   │ Ruiz Santana   │ Huelva  │ 200       │ 4         │ 3            │ 2016-08-17   │ 110.5   │
│ 8          │ Pepe   │ Ruiz Santana   │ Huelva  │ 200       │ 9         │ 3            │ 2016-10-10   │ 2480.4  │
│ 8          │ Pepe   │ Ruiz Santana   │ Huelva  │ 200       │ 10        │ 2            │ 2015-06-27   │ 250.45  │
│ 7          │ Pilar  │ Ruiz           │ Sevilla │ 300       │ 6         │ 1            │ 2016-07-27   │ 2400.6  │
└────────────┴────────┴────────────────┴─────────┴───────────┴───────────┴──────────────┴──────────────┴─────────┘
*/

-- Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
select c.id as id_comercial, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos, c.categoria, p.id as id_pedido, p.fecha as fecha_pedido, p.total, p.id_cliente from pedido as p join comercial as c on p.id_comercial = c.id order by c.nombre;

/*
┌──────────────┬─────────┬─────────────────────┬───────────┬───────────┬──────────────┬─────────┬────────────┐
│ id_comercial │ nombre  │      apellidos      │ categoria │ id_pedido │ fecha_pedido │  total  │ id_cliente │
├──────────────┼─────────┼─────────────────────┼───────────┼───────────┼──────────────┼─────────┼────────────┤
│ 5            │ Antonio │ Carretero Ortega    │ 0.12      │ 2         │ 2016-09-10   │ 270.65  │ 1          │
│ 7            │ Antonio │ Vega Hernández      │ 0.11      │ 11        │ 2016-08-17   │ 75.29   │ 3          │
│ 5            │ Antonio │ Carretero Ortega    │ 0.12      │ 15        │ 2019-03-11   │ 370.85  │ 1          │
│ 5            │ Antonio │ Carretero Ortega    │ 0.12      │ 16        │ 2019-03-11   │ 2389.23 │ 1          │
│ 1            │ Daniel  │ Sáez Vega           │ 0.15      │ 3         │ 2017-10-05   │ 65.26   │ 2          │
│ 1            │ Daniel  │ Sáez Vega           │ 0.15      │ 6         │ 2016-07-27   │ 2400.6  │ 7          │
│ 1            │ Daniel  │ Sáez Vega           │ 0.15      │ 7         │ 2015-09-10   │ 5760.0  │ 2          │
│ 1            │ Daniel  │ Sáez Vega           │ 0.15      │ 12        │ 2017-04-25   │ 3045.6  │ 2          │
│ 1            │ Daniel  │ Sáez Vega           │ 0.15      │ 13        │ 2019-01-25   │ 545.75  │ 6          │
│ 1            │ Daniel  │ Sáez Vega           │ 0.15      │ 14        │ 2017-02-02   │ 145.82  │ 6          │
│ 3            │ Diego   │ Flores Salas        │ 0.11      │ 4         │ 2016-08-17   │ 110.5   │ 8          │
│ 3            │ Diego   │ Flores Salas        │ 0.11      │ 9         │ 2016-10-10   │ 2480.4  │ 8          │
│ 2            │ Juan    │ Gómez López         │ 0.13      │ 1         │ 2017-10-05   │ 150.5   │ 5          │
│ 2            │ Juan    │ Gómez López         │ 0.13      │ 5         │ 2017-09-10   │ 948.5   │ 5          │
│ 2            │ Juan    │ Gómez López         │ 0.13      │ 10        │ 2015-06-27   │ 250.45  │ 8          │
│ 6            │ Manuel  │ Domínguez Hernández │ 0.13      │ 8         │ 2017-10-10   │ 1983.43 │ 4          │
└──────────────┴─────────┴─────────────────────┴───────────┴───────────┴──────────────┴─────────┴────────────┘
*/

-- Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
select p.id_cliente, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos, c.ciudad as ciudad, c.categoria as categoria_cliente, p.id as id_pedido, p.fecha as fecha_pedido, p.total, p.id_comercial, co.nombre, co.apellido1 || ' ' || coalesce(co.apellido2, '') as apellidos, co.categoria as categoria_comercial from pedido as p join cliente as c on p.id_cliente = c.id join comercial as co on co.id = p.id_comercial;

/*
┌────────────┬────────┬────────────────┬─────────┬───────────────────┬───────────┬──────────────┬─────────┬──────────────┬─────────┬─────────────────────┬─────────────────────┐
│ id_cliente │ nombre │   apellidos    │ ciudad  │ categoria_cliente │ id_pedido │ fecha_pedido │  total  │ id_comercial │ nombre  │      apellidos      │ categoria_comercial │
├────────────┼────────┼────────────────┼─────────┼───────────────────┼───────────┼──────────────┼─────────┼──────────────┼─────────┼─────────────────────┼─────────────────────┤
│ 5          │ Marcos │ Loyola Méndez  │ Almería │ 200               │ 1         │ 2017-10-05   │ 150.5   │ 2            │ Juan    │ Gómez López         │ 0.13                │
│ 1          │ Aarón  │ Rivero Gómez   │ Almería │ 100               │ 2         │ 2016-09-10   │ 270.65  │ 5            │ Antonio │ Carretero Ortega    │ 0.12                │
│ 2          │ Adela  │ Salas Díaz     │ Granada │ 200               │ 3         │ 2017-10-05   │ 65.26   │ 1            │ Daniel  │ Sáez Vega           │ 0.15                │
│ 8          │ Pepe   │ Ruiz Santana   │ Huelva  │ 200               │ 4         │ 2016-08-17   │ 110.5   │ 3            │ Diego   │ Flores Salas        │ 0.11                │
│ 5          │ Marcos │ Loyola Méndez  │ Almería │ 200               │ 5         │ 2017-09-10   │ 948.5   │ 2            │ Juan    │ Gómez López         │ 0.13                │
│ 7          │ Pilar  │ Ruiz           │ Sevilla │ 300               │ 6         │ 2016-07-27   │ 2400.6  │ 1            │ Daniel  │ Sáez Vega           │ 0.15                │
│ 2          │ Adela  │ Salas Díaz     │ Granada │ 200               │ 7         │ 2015-09-10   │ 5760.0  │ 1            │ Daniel  │ Sáez Vega           │ 0.15                │
│ 4          │ Adrián │ Suárez         │ Jaén    │ 300               │ 8         │ 2017-10-10   │ 1983.43 │ 6            │ Manuel  │ Domínguez Hernández │ 0.13                │
│ 8          │ Pepe   │ Ruiz Santana   │ Huelva  │ 200               │ 9         │ 2016-10-10   │ 2480.4  │ 3            │ Diego   │ Flores Salas        │ 0.11                │
│ 8          │ Pepe   │ Ruiz Santana   │ Huelva  │ 200               │ 10        │ 2015-06-27   │ 250.45  │ 2            │ Juan    │ Gómez López         │ 0.13                │
│ 3          │ Adolfo │ Rubio Flores   │ Sevilla │                   │ 11        │ 2016-08-17   │ 75.29   │ 7            │ Antonio │ Vega Hernández      │ 0.11                │
│ 2          │ Adela  │ Salas Díaz     │ Granada │ 200               │ 12        │ 2017-04-25   │ 3045.6  │ 1            │ Daniel  │ Sáez Vega           │ 0.15                │
│ 6          │ María  │ Santana Moreno │ Cádiz   │ 100               │ 13        │ 2019-01-25   │ 545.75  │ 1            │ Daniel  │ Sáez Vega           │ 0.15                │
│ 6          │ María  │ Santana Moreno │ Cádiz   │ 100               │ 14        │ 2017-02-02   │ 145.82  │ 1            │ Daniel  │ Sáez Vega           │ 0.15                │
│ 1          │ Aarón  │ Rivero Gómez   │ Almería │ 100               │ 15        │ 2019-03-11   │ 370.85  │ 5            │ Antonio │ Carretero Ortega    │ 0.12                │
│ 1          │ Aarón  │ Rivero Gómez   │ Almería │ 100               │ 16        │ 2019-03-11   │ 2389.23 │ 5            │ Antonio │ Carretero Ortega    │ 0.12                │
└────────────┴────────┴────────────────┴─────────┴───────────────────┴───────────┴──────────────┴─────────┴──────────────┴─────────┴─────────────────────┴─────────────────────┘
*/

-- Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
select c.* from cliente as c join pedido as p on c.id = p.id_cliente where p.fecha regexp '2017' and p.total between 300 and 1000;

/*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
*/

-- Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
select distinct co.nombre, co.apellido1 || ' ' || coalesce(co.apellido2, '') as apellidos from comercial as co join pedido as p on p.id_comercial = co.id join cliente as c on p.id_cliente = c.id where c.nombre = 'María' and c.apellido1 = 'Santana' and c.apellido2 = 'Moreno';

/*
┌────────┬───────────┐
│ nombre │ apellidos │
├────────┼───────────┤
│ Daniel │ Sáez Vega │
└────────┴───────────┘
*/

-- Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
select distinct c.nombre from cliente as c join pedido as p on p.id_cliente = c.id join comercial as co on p.id_comercial = co.id where co.nombre = 'Daniel' and co.apellido1 = 'Sáez' and co.apellido2 = 'Vega';

/*
┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ Pilar  │
│ María  │
└────────┘
*/

-- Consultas resumen (Funciones)

-- Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(total) as total_pedidos from pedido;

/*
┌───────────────┐
│ total_pedidos │
├───────────────┤
│ 20992.83      │
└───────────────┘
*/

-- Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select round(avg(total), 2) as media_pedidos from pedido;

/*
┌───────────────┐
│ media_pedidos │
├───────────────┤
│ 1312.05       │
└───────────────┘
*/

-- Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
select count(distinct(id_comercial)) as comerciales from pedido;

/*
┌─────────────┐
│ comerciales │
├─────────────┤
│ 6           │
└─────────────┘
*/

-- Calcula el número total de clientes que aparecen en la tabla cliente.
select count(id) as total_clientes from cliente;

/*
┌────────────────┐
│ total_clientes │
├────────────────┤
│ 10             │
└────────────────┘
*/

-- Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(total) as max_cantidad from pedido;

/*
┌──────────────┐
│ max_cantidad │
├──────────────┤
│ 5760.0       │
└──────────────┘
*/

-- Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(total) as min_cantidad from pedido;

/*
┌──────────────┐
│ min_cantidad │
├──────────────┤
│ 65.26        │
└──────────────┘
*/

-- Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select ciudad, max(categoria) as max_categoria from cliente group by ciudad;

/*
┌─────────┬───────────────┐
│ ciudad  │ max_categoria │
├─────────┼───────────────┤
│ Almería │ 200           │
│ Cádiz   │ 100           │
│ Granada │ 225           │
│ Huelva  │ 200           │
│ Jaén    │ 300           │
│ Sevilla │ 300           │
└─────────┴───────────────┘
*/

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.

-- Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.

-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.

-- Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.

-- Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

-- Devuelve el número total de pedidos que se han realizado cada año.

-- Subconsultas con operadores básicos de comparación

-- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

-- Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

-- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

-- Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

-- Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.

-- Subconsultas con IN y NOT IN

-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

-- Subconsultas con EXISTS y NOT EXISTS

-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
