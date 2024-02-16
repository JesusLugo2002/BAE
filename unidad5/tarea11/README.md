# Ejercicios de consultas con regexp y funciones

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Índice

- [Consultas sobre una table](#consultas-sql-sobre-una-tabla)
- [Consultas multitablas (con Where)](#consultas-multitabla-where-para-unir-tablas)
- [Consultas multitables (con Join)](#consultas-multitabla-inner-join)
- [Consultas resumen](#consultas-resumen-countavg)
- [Subconsultas](#subconsultas-en-sql)
- [Consultas variadas](#consultas-variadas-en-sql)

### Consultas SQL sobre una tabla

- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
```sql
select codigo_oficina, ciudad from oficina;
```
| codigo_oficina |        ciudad        |
|----------------|----------------------|
| BCN-ES         | Barcelona            |
| BOS-USA        | Boston               |
| LON-UK         | Londres              |
| MAD-ES         | Madrid               |
| PAR-FR         | Paris                |
| SFC-USA        | San Francisco        |
| SYD-AU         | Sydney               |
| TAL-ES         | Talavera de la Reina |
| TOK-JP         | Tokyo                |

- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
```sql
select ciudad, telefono from oficina where pais = 'España';
```
|        ciudad        |    telefono    |
|----------------------|----------------|
| Barcelona            | +34 93 3561182 |
| Madrid               | +34 91 7514487 |
| Talavera de la Reina | +34 925 867231 |

- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
```sql
select nombre, apellido1, apellido2, email from empleado where codigo_jefe = 7;
```
| nombre  | apellido1 | apellido2 |          email           |
|---------|-----------|-----------|--------------------------|
| Mariano | López     | Murcia    | mlopez@jardineria.es     |
| Lucio   | Campoamor | Martín    | lcampoamor@jardineria.es |
| Hilario | Rodriguez | Huertas   | hrodriguez@jardineria.es |

- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
```sql
select puesto, nombre, apellido1, apellido2, email from empleado where codigo_jefe is Null;
```
|      puesto      | nombre | apellido1 | apellido2 |        email         |
|------------------|--------|-----------|-----------|----------------------|
| Director General | Marcos | Magaña    | Perez     | marcos@jardineria.es |

- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
```sql
select nombre, apellido1, apellido2, puesto from empleado where puesto != 'Representante Ventas';
```
|  nombre  | apellido1  | apellido2 |        puesto         |
|----------|------------|-----------|-----------------------|
| Marcos   | Magaña     | Perez     | Director General      |
| Ruben    | López      | Martinez  | Subdirector Marketing |
| Alberto  | Soria      | Carrasco  | Subdirector Ventas    |
| Maria    | Solís      | Jerez     | Secretaria            |
| Carlos   | Soria      | Jimenez   | Director Oficina      |
| Emmanuel | Magaña     | Perez     | Director Oficina      |
| Francois | Fignon     |           | Director Oficina      |
| Michael  | Bolton     |           | Director Oficina      |
| Hilary   | Washington |           | Director Oficina      |
| Nei      | Nishikori  |           | Director Oficina      |
| Amy      | Johnson    |           | Director Oficina      |
| Kevin    | Fallmer    |           | Director Oficina      |

- Devuelve un listado con el nombre de los todos los clientes españoles.
```sql
select nombre_cliente from cliente where pais = 'Spain';
```
|         nombre_cliente         |
|--------------------------------|
| Lasas S.A.                     |
| Beragua                        |
| Club Golf Puerta del hierro    |
| Naturagua                      |
| DaraDistribuciones             |
| Madrileña de riegos            |
| Lasas S.A.                     |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Flowers, S.A                   |
| Naturajardin                   |
| Golf S.A.                      |
| Americh Golf Management SL     |
| Aloha                          |
| El Prat                        |
| Sotogrande                     |
| Vivero Humanes                 |
| Fuenla City                    |
| Jardines y Mansiones Cactus SL |
| Jardinerías Matías SL          |
| Agrojardin                     |
| Top Campo                      |
| Jardineria Sara                |
| Campohermoso                   |
| Flores S.L.                    |

- Devuelve un listado con los distintos estados por los que puede pasar un pedido.
```sql
select distinct estado from pedido;
```
|  estado   |
|-----------|
| Entregado |
| Rechazado |
| Pendiente |

- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.
```sql
select distinct codigo_cliente from pago where fecha_pago regexp '2008';
```
| codigo_cliente |
|----------------|
| 1              |
| 13             |
| 14             |
| 26             |

- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega > fecha_esperada;
```
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
|---------------|----------------|----------------|---------------|
| 9             | 1              | 2008-12-27     | 2008-12-28    |
| 13            | 7              | 2009-01-14     | 2009-01-15    |
| 16            | 7              | 2009-01-07     | 2009-01-15    |
| 17            | 7              | 2009-01-09     | 2009-01-11    |
| 18            | 9              | 2009-01-06     | 2009-01-07    |
| 22            | 9              | 2009-01-11     | 2009-01-13    |
| 28            | 3              | 2009-02-17     | 2009-02-20    |
| 31            | 13             | 2008-09-30     | 2008-10-04    |
| 32            | 4              | 2007-01-19     | 2007-01-27    |
| 38            | 19             | 2009-03-06     | 2009-03-07    |
| 39            | 19             | 2009-03-07     | 2009-03-09    |
| 40            | 19             | 2009-03-10     | 2009-03-13    |
| 42            | 19             | 2009-03-23     | 2009-03-27    |
| 43            | 23             | 2009-03-26     | 2009-03-28    |
| 44            | 23             | 2009-03-27     | 2009-03-30    |
| 45            | 23             | 2009-03-04     | 2009-03-07    |
| 46            | 23             | 2009-03-04     | 2009-03-05    |
| 49            | 26             | 2008-07-22     | 2008-07-30    |
| 55            | 14             | 2009-01-10     | 2009-01-11    |
| 60            | 1              | 2008-12-27     | 2008-12-28    |
| 68            | 3              | 2009-02-17     | 2009-02-20    |
| 92            | 27             | 2009-04-30     | 2009-05-03    |
| 96            | 35             | 2008-04-12     | 2008-04-13    |
| 103           | 30             | 2009-01-20     | 2009-01-24    |
| 106           | 30             | 2009-05-15     | 2009-05-20    |
| 112           | 36             | 2009-04-06     | 2009-05-07    |
| 113           | 36             | 2008-11-09     | 2009-01-09    |
| 114           | 36             | 2009-01-29     | 2009-01-31    |
| 115           | 36             | 2009-01-26     | 2009-02-27    |
| 123           | 30             | 2009-01-20     | 2009-01-24    |
| 126           | 30             | 2009-05-15     | 2009-05-20    |
| 128           | 38             | 2008-12-10     | 2008-12-29    |


- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega < fecha_esperada - 2; -- NO SIRVE
```
- Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
```sql
select * from pedido where estado = 'Rechazado' and fecha_pedido regexp '2009';
```
| codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega |  estado   |                         comentarios                          | codigo_cliente |
|---------------|--------------|----------------|---------------|-----------|--------------------------------------------------------------|----------------|
| 14            | 2009-01-02   | 2009-01-02     |               | Rechazado | mal pago                                                     | 7              |
| 21            | 2009-01-09   | 2009-01-09     | 2009-01-09    | Rechazado | mal pago                                                     | 9              |
| 25            | 2009-02-02   | 2009-02-08     |               | Rechazado | El cliente carece de saldo en la cuenta asociada             | 1              |
| 26            | 2009-02-06   | 2009-02-12     |               | Rechazado | El cliente anula la operacion para adquirir mas producto     | 3              |
| 40            | 2009-03-09   | 2009-03-10     | 2009-03-13    | Rechazado |                                                              | 19             |
| 46            | 2009-04-03   | 2009-03-04     | 2009-03-05    | Rechazado |                                                              | 23             |
| 65            | 2009-02-02   | 2009-02-08     |               | Rechazado | El cliente carece de saldo en la cuenta asociada             | 1              |
| 66            | 2009-02-06   | 2009-02-12     |               | Rechazado | El cliente anula la operacion para adquirir mas producto     | 3              |
| 74            | 2009-01-14   | 2009-01-22     |               | Rechazado | El pedido no llego el dia que queria el cliente por fallo de | 15             |
|               |              |                |               |           | l transporte                                                 |                |
| 81            | 2009-01-18   | 2009-01-24     |               | Rechazado | Los producto estaban en mal estado                           | 28             |
| 101           | 2009-03-07   | 2009-03-27     |               | Rechazado | El pedido fue rechazado por el cliente                       | 16             |
| 105           | 2009-02-14   | 2009-02-20     |               | Rechazado | el producto ha sido rechazado por la pesima calidad          | 30             |
| 120           | 2009-03-07   | 2009-03-27     |               | Rechazado | El pedido fue rechazado por el cliente                       | 16             |
| 125           | 2009-02-14   | 2009-02-20     |               | Rechazado | el producto ha sido rechazado por la pesima calidad          | 30             |

- Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
```sql
select * from pedido where estado regexp 'Entregado' and fecha_pedido regexp '-01-';
```
| codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega |  estado   |                      comentarios                       | codigo_cliente |
|---------------|--------------|----------------|---------------|-----------|--------------------------------------------------------|----------------|
| 1             | 2006-01-17   | 2006-01-19     | 2006-01-19    | Entregado | Pagado a plazos                                        | 5              |
| 13            | 2009-01-12   | 2009-01-14     | 2009-01-15    | Entregado |                                                        | 7              |
| 15            | 2009-01-09   | 2009-01-12     | 2009-01-11    | Entregado |                                                        | 7              |
| 16            | 2009-01-06   | 2009-01-07     | 2009-01-15    | Entregado |                                                        | 7              |
| 17            | 2009-01-08   | 2009-01-09     | 2009-01-11    | Entregado | mal estado                                             | 7              |
| 18            | 2009-01-05   | 2009-01-06     | 2009-01-07    | Entregado |                                                        | 9              |
| 22            | 2009-01-11   | 2009-01-11     | 2009-01-13    | Entregado |                                                        | 9              |
| 32            | 2007-01-07   | 2007-01-19     | 2007-01-27    | Entregado | Entrega tardia, el cliente puso reclamacion            | 4              |
| 58            | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                          | 3              |
| 64            | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                          | 1              |
| 75            | 2009-01-11   | 2009-01-13     | 2009-01-13    | Entregado | El pedido llego perfectamente                          | 15             |
| 79            | 2009-01-12   | 2009-01-13     | 2009-01-13    | Entregado |                                                        | 28             |
| 82            | 2009-01-20   | 2009-01-29     | 2009-01-29    | Entregado | El pedido llego un poco mas tarde de la hora fijada    | 28             |
| 83            | 2009-01-24   | 2009-01-28     |               | Entregado |                                                        | 28             |
| 95            | 2008-01-04   | 2008-01-19     | 2008-01-19    | Entregado |                                                        | 35             |
| 100           | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                          | 16             |
| 114           | 2009-01-15   | 2009-01-29     | 2009-01-31    | Entregado | El envio llego dos dias más tarde debido al mal tiempo | 36             |
| 119           | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                          | 16             |

- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
```sql
select * from pago where fecha_pago regexp '2008' and forma_pago = 'PayPal' order by total desc;
```
| codigo_cliente | forma_pago | id_transaccion | fecha_pago | total |
|----------------|------------|----------------|------------|-------|
| 26             | PayPal     | ak-std-000020  | 2008-03-18 | 18846 |
| 14             | PayPal     | ak-std-000015  | 2008-07-15 | 4160  |
| 13             | PayPal     | ak-std-000014  | 2008-08-04 | 2246  |
| 1              | PayPal     | ak-std-000001  | 2008-11-10 | 2000  |
| 1              | PayPal     | ak-std-000002  | 2008-12-10 | 2000  |

- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
```sql
select distinct forma_pago from pago;
```
|  forma_pago   |
|---------------|
| PayPal        |
| Transferencia |
| Cheque        |

- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
```sql
select * from producto where gama = 'Ornamentales' and cantidad_en_stock > 100 order by precio_venta desc;
```
| codigo_producto |                    nombre                    |     gama     | dimensiones |    proveedor     |                         descripcion                          | cantidad_en_stock | precio_venta | precio_proveedor |
|-----------------|----------------------------------------------|--------------|-------------|------------------|--------------------------------------------------------------|-------------------|--------------|------------------|
| OR-115          | Forsytia Intermedia \"Lynwood\"              | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 7            | 5                |
| OR-116          | Hibiscus Syriacus  \"Diana\" -Blanco Puro    | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente mo | 120               | 7            | 5                |
|                 |                                              |              |             |                  | ldeadas como bonsái en el transcurso de pocos años. Flores d |                   |              |                  |
|                 |                                              |              |             |                  | e muchos colores según la variedad, desde el blanco puro al  |                   |              |                  |
|                 |                                              |              |             |                  | rojo intenso, del amarillo al anaranjado. La flor apenas dur |                   |              |                  |
|                 |                                              |              |             |                  | a 1 día, pero continuamente aparecen nuevas y la floración s |                   |              |                  |
|                 |                                              |              |             |                  | e prolonga durante todo el periodo de crecimiento vegetativo |                   |              |                  |
|                 |                                              |              |             |                  | .                                                            |                   |              |                  |
| OR-117          | Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente mo | 120               | 7            | 5                |
|                 |                                              |              |             |                  | ldeadas como bonsái en el transcurso de pocos años. Flores d |                   |              |                  |
|                 |                                              |              |             |                  | e muchos colores según la variedad, desde el blanco puro al  |                   |              |                  |
|                 |                                              |              |             |                  | rojo intenso, del amarillo al anaranjado. La flor apenas dur |                   |              |                  |
|                 |                                              |              |             |                  | a 1 día, pero continuamente aparecen nuevas y la floración s |                   |              |                  |
|                 |                                              |              |             |                  | e prolonga durante todo el periodo de crecimiento vegetativo |                   |              |                  |
|                 |                                              |              |             |                  | .                                                            |                   |              |                  |
| OR-118          | Hibiscus Syriacus \"Pink Giant\" Rosa        | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente mo | 120               | 7            | 5                |
|                 |                                              |              |             |                  | ldeadas como bonsái en el transcurso de pocos años. Flores d |                   |              |                  |
|                 |                                              |              |             |                  | e muchos colores según la variedad, desde el blanco puro al  |                   |              |                  |
|                 |                                              |              |             |                  | rojo intenso, del amarillo al anaranjado. La flor apenas dur |                   |              |                  |
|                 |                                              |              |             |                  | a 1 día, pero continuamente aparecen nuevas y la floración s |                   |              |                  |
|                 |                                              |              |             |                  | e prolonga durante todo el periodo de crecimiento vegetativo |                   |              |                  |
|                 |                                              |              |             |                  | .                                                            |                   |              |                  |
| OR-112          | Escallonia (Mix)                             | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-113          | Evonimus Emerald Gayeti                      | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-114          | Evonimus Pulchellus                          | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-119          | Laurus Nobilis Arbusto - Ramificado Bajo     | Ornamentales | 40-50       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-120          | Lonicera Nitida                              | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-121          | Lonicera Nitida \"Maigrum\"                  | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-122          | Lonicera Pileata                             | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-123          | Philadelphus \"Virginal\"                    | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-124          | Prunus pisardii                              | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-125          | Viburnum Tinus \"Eve Price\"                 | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-126          | Weigelia \"Bristol Ruby\"                    | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |

- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
```sql
select * from cliente where ciudad = 'Madrid' and codigo_empleado_rep_ventas in (11, 30);
```
| codigo_cliente |       nombre_cliente        | nombre_contacto | apellido_contacto | telefono  |    fax    | linea_direccion1  | linea_direccion2 | ciudad | region | pais  | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|-----------------------------|-----------------|-------------------|-----------|-----------|-------------------|------------------|--------|--------|-------|---------------|----------------------------|----------------|
| 7              | Beragua                     | Jose            | Bermejo           | 654987321 | 916549872 | C/pintor segundo  | Getafe           | Madrid | Madrid | Spain | 28942         | 11                         | 20000          |
| 8              | Club Golf Puerta del hierro | Paco            | Lopez             | 62456810  | 919535678 | C/sinesio delgado | Madrid           | Madrid | Madrid | Spain | 28930         | 11                         | 40000          |
| 9              | Naturagua                   | Guillermo       | Rengifo           | 689234750 | 916428956 | C/majadahonda     | Boadilla         | Madrid | Madrid | Spain | 28947         | 11                         | 32000          |
| 10             | DaraDistribuciones          | David           | Serrano           | 675598001 | 916421756 | C/azores          | Fuenlabrada      | Madrid | Madrid | Spain | 28946         | 11                         | 50000          |
| 11             | Madrileña de riegos         | Jose            | Tacaño            | 655983045 | 916689215 | C/Lagañas         | Fuenlabrada      | Madrid | Madrid | Spain | 28943         | 11                         | 20000          |
| 15             | Jardin de Flores            | Javier          | Villar            | 654865643 | 914538776 | C/ Oña 34         |                  | Madrid | Madrid | Spain | 28950         | 30                         | 40000          |
| 18             | Naturajardin                | Victoria        | Cruz              | 612343529 | 916548735 | Plaza Magallón 15 |                  | Madrid | Madrid | Spain | 28011         | 30                         | 5050           |

### Consultas multitabla (Where para unir tablas)

- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
- Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
- Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
- Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
- Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
- Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
- Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

### Consultas multitabla (inner join)

- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
- Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
- Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
- Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
- Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
- Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
- Devuelve un listado de los productos que nunca han aparecido en un pedido.
- Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
- Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
- Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
- Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

### Consultas resumen (count,avg,...)

- ¿Cuántos empleados hay en la compañía?
- ¿Cuántos clientes tiene cada país?
- ¿Cuál fue el pago medio en 2009?
- ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
- Calcula el precio de venta del producto más caro y más barato en una misma consulta.
- Calcula el número de clientes que tiene la empresa.
- ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
- ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
- Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
- Calcula el número de clientes que no tiene asignado representante de ventas.
- Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
- Calcula el número de productos diferentes que hay en cada uno de los pedidos.
- Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
- Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
- La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IGIC y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IGIC es el 7 % de la base imponible, y el total la suma de los dos campos anteriores.
- La misma información que en la pregunta anterior, pero agrupada por código de producto.
- La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
- Lista las ventas totales de los productos que hayan facturado más de __3000 euros__. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (7% IGIC).
- Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

### Subconsultas en SQL

- Devuelve el nombre del cliente con mayor límite de crédito.
- Devuelve el nombre del producto que tenga el precio de venta más caro.
- Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
- Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
- Devuelve el producto que más unidades tiene en stock.
- Devuelve el producto que menos unidades tiene en stock.
- Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
- Devuelve el nombre del cliente con mayor límite de crédito.
- Devuelve el nombre del producto que tenga el precio de venta más caro.
- Devuelve el producto que menos unidades tiene en stock.
- Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
- Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
- Devuelve un listado de los productos que nunca han aparecido en un pedido.
- Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
- Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
- Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
- Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
- Devuelve un listado de los productos que nunca han aparecido en un pedido.
- Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

### Consultas variadas en SQL

- Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
- Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
- Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
- Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
- Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
- Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
- Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.