# Ejercicios de repaso

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

<div align=justify>

## Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
```sql
select distinct nombre, apellido1, apellido2 from persona where tipo = 'alumno' order by apellido1, apellido2, nombre;
```
|  nombre  | apellido1 | apellido2 |
|----------|-----------|-----------|
| Antonio  | Domínguez | Guerrero  |
| Sonia    | Gea       | Ruiz      |
| Juan     | Gutiérrez | López     |
| Pedro    | Heller    | Pagac     |
| Daniel   | Herman    | Pacocha   |
| Irene    | Hernández | Martínez  |
| Ramón    | Herzog    | Tremblay  |
| José     | Koss      | Bayer     |
| Inma     | Lakin     | Yundt     |
| Juan     | Saez      | Vega      |
| Ismael   | Strosin   | Turcotte  |
| Salvador | Sánchez   | Pérez     |

2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
```sql
select distinct nombre, apellido1, apellido2 from persona where tipo = 'alumno' and telefono is null;
```
| nombre | apellido1 | apellido2 |
|--------|-----------|-----------|
| Pedro  | Heller    | Pagac     |
| Ismael | Strosin   | Turcotte  |


3. Devuelve el listado de los alumnos que nacieron en 1999.
```sql
select * from persona where tipo = 'alumno' and fecha_nacimiento regexp '1999';
```
| id |    nif    | nombre  | apellido1 | apellido2 | ciudad  |    direccion    | telefono  | fecha_nacimiento | sexo |  tipo  |
|----|-----------|---------|-----------|-----------|---------|-----------------|-----------|------------------|------|--------|
| 7  | 97258166K | Ismael  | Strosin   | Turcotte  | Almería | C/ Neptuno      |           | 1999/05/24       | H    | alumno |
| 22 | 41491230N | Antonio | Domínguez | Guerrero  | Almería | C/ Cabo de Gata | 626652498 | 1999/02/11       | H    | alumno |


4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
```sql
select * from persona where tipo = 'profesor' and telefono is null and nif regexp 'K$';
```
| id |    nif    |  nombre   | apellido1 | apellido2 | ciudad  |         direccion         | telefono | fecha_nacimiento | sexo |   tipo   |
|----|-----------|-----------|-----------|-----------|---------|---------------------------|----------|------------------|------|----------|
| 16 | 10485008K | Antonio   | Fahey     | Considine | Almería | C/ Sierra de los Filabres |          | 1982/03/18       | H    | profesor |
| 17 | 85869555K | Guillermo | Ruecker   | Upton     | Almería | C/ Sierra de Gádor        |          | 1973/05/05       | H    | profesor |


5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
```sql
select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;
```
| id |                  nombre                   | creditos |    tipo     | curso | cuatrimestre | id_profesor | id_grado |
|----|-------------------------------------------|----------|-------------|-------|--------------|-------------|----------|
| 72 | Bases moleculares del desarrollo vegetal  | 4.5      | obligatoria | 3     | 1            |             | 7        |
| 73 | Fisiología animal                         | 4.5      | obligatoria | 3     | 1            |             | 7        |
| 74 | Metabolismo y biosíntesis de biomoléculas | 6.0      | obligatoria | 3     | 1            |             | 7        |
| 75 | Operaciones de separación                 | 6.0      | obligatoria | 3     | 1            |             | 7        |
| 76 | Patología molecular de plantas            | 4.5      | obligatoria | 3     | 1            |             | 7        |
| 77 | Técnicas instrumentales básicas           | 4.5      | obligatoria | 3     | 1            |             | 7        |


## Consultas multitabla (Join)

1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
```sql
select distinct p.* from persona as p join alumno_se_matricula_asignatura as a on p.id = a.id_alumno join asignatura as asig on a.id_asignatura = asig.id join grado as g on g.id = asig.id_grado where p.sexo = 'M' and g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
```
| id |    nif    | nombre | apellido1 | apellido2 | ciudad  |     direccion      | telefono  | fecha_nacimiento | sexo |  tipo  |
|----|-----------|--------|-----------|-----------|---------|--------------------|-----------|------------------|------|--------|
| 19 | 11578526G | Inma   | Lakin     | Yundt     | Almería | C/ Picos de Europa | 678652431 | 1998/09/01       | M    | alumno |
| 23 | 64753215G | Irene  | Hernández | Martínez  | Almería | C/ Zapillo         | 628452384 | 1996/03/12       | M    | alumno |
| 24 | 85135690V | Sonia  | Gea       | Ruiz      | Almería | C/ Mercurio        | 678812017 | 1995/04/13       | M    | alumno |


2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
```sql
select asig.* from asignatura as asig join grado as g on g.id = asig.id_grado where g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
```
| id |                                 nombre                                 | creditos |    tipo     | curso | cuatrimestre | id_profesor | id_grado |
|----|------------------------------------------------------------------------|----------|-------------|-------|--------------|-------------|----------|
| 1  | Álgegra lineal y matemática discreta                                   | 6.0      | básica      | 1     | 1            | 3           | 4        |
| 2  | Cálculo                                                                | 6.0      | básica      | 1     | 1            | 14          | 4        |
| 3  | Física para informática                                                | 6.0      | básica      | 1     | 1            | 3           | 4        |
| 4  | Introducción a la programación                                         | 6.0      | básica      | 1     | 1            | 14          | 4        |
| 5  | Organización y gestión de empresas                                     | 6.0      | básica      | 1     | 1            | 3           | 4        |
| 6  | Estadística                                                            | 6.0      | básica      | 1     | 2            | 14          | 4        |
| 7  | Estructura y tecnología de computadores                                | 6.0      | básica      | 1     | 2            | 3           | 4        |
| 8  | Fundamentos de electrónica                                             | 6.0      | básica      | 1     | 2            | 14          | 4        |
| 9  | Lógica y algorítmica                                                   | 6.0      | básica      | 1     | 2            | 3           | 4        |
| 10 | Metodología de la programación                                         | 6.0      | básica      | 1     | 2            | 14          | 4        |
| 11 | Arquitectura de Computadores                                           | 6.0      | básica      | 2     | 1            | 3           | 4        |
| 12 | Estructura de Datos y Algoritmos I                                     | 6.0      | obligatoria | 2     | 1            | 3           | 4        |
| 13 | Ingeniería del Software                                                | 6.0      | obligatoria | 2     | 1            | 14          | 4        |
| 14 | Sistemas Inteligentes                                                  | 6.0      | obligatoria | 2     | 1            | 3           | 4        |
| 15 | Sistemas Operativos                                                    | 6.0      | obligatoria | 2     | 1            | 14          | 4        |
| 16 | Bases de Datos                                                         | 6.0      | básica      | 2     | 2            | 14          | 4        |
| 17 | Estructura de Datos y Algoritmos II                                    | 6.0      | obligatoria | 2     | 2            | 14          | 4        |
| 18 | Fundamentos de Redes de Computadores                                   | 6.0      | obligatoria | 2     | 2            | 3           | 4        |
| 19 | Planificación y Gestión de Proyectos Informáticos                      | 6.0      | obligatoria | 2     | 2            | 3           | 4        |
| 20 | Programación de Servicios Software                                     | 6.0      | obligatoria | 2     | 2            | 14          | 4        |
| 21 | Desarrollo de interfaces de usuario                                    | 6.0      | obligatoria | 3     | 1            | 14          | 4        |
| 22 | Ingeniería de Requisitos                                               | 6.0      | optativa    | 3     | 1            |             | 4        |
| 23 | Integración de las Tecnologías de la Información en las Organizaciones | 6.0      | optativa    | 3     | 1            |             | 4        |
| 24 | Modelado y Diseño del Software 1                                       | 6.0      | optativa    | 3     | 1            |             | 4        |
| 25 | Multiprocesadores                                                      | 6.0      | optativa    | 3     | 1            |             | 4        |
| 26 | Seguridad y cumplimiento normativo                                     | 6.0      | optativa    | 3     | 1            |             | 4        |
| 27 | Sistema de Información para las Organizaciones                         | 6.0      | optativa    | 3     | 1            |             | 4        |
| 28 | Tecnologías web                                                        | 6.0      | optativa    | 3     | 1            |             | 4        |
| 29 | Teoría de códigos y criptografía                                       | 6.0      | optativa    | 3     | 1            |             | 4        |
| 30 | Administración de bases de datos                                       | 6.0      | optativa    | 3     | 2            |             | 4        |
| 31 | Herramientas y Métodos de Ingeniería del Software                      | 6.0      | optativa    | 3     | 2            |             | 4        |
| 32 | Informática industrial y robótica                                      | 6.0      | optativa    | 3     | 2            |             | 4        |
| 33 | Ingeniería de Sistemas de Información                                  | 6.0      | optativa    | 3     | 2            |             | 4        |
| 34 | Modelado y Diseño del Software 2                                       | 6.0      | optativa    | 3     | 2            |             | 4        |
| 35 | Negocio Electrónico                                                    | 6.0      | optativa    | 3     | 2            |             | 4        |
| 36 | Periféricos e interfaces                                               | 6.0      | optativa    | 3     | 2            |             | 4        |
| 37 | Sistemas de tiempo real                                                | 6.0      | optativa    | 3     | 2            |             | 4        |
| 38 | Tecnologías de acceso a red                                            | 6.0      | optativa    | 3     | 2            |             | 4        |
| 39 | Tratamiento digital de imágenes                                        | 6.0      | optativa    | 3     | 2            |             | 4        |
| 40 | Administración de redes y sistemas operativos                          | 6.0      | optativa    | 4     | 1            |             | 4        |
| 41 | Almacenes de Datos                                                     | 6.0      | optativa    | 4     | 1            |             | 4        |
| 42 | Fiabilidad y Gestión de Riesgos                                        | 6.0      | optativa    | 4     | 1            |             | 4        |
| 43 | Líneas de Productos Software                                           | 6.0      | optativa    | 4     | 1            |             | 4        |
| 44 | Procesos de Ingeniería del Software 1                                  | 6.0      | optativa    | 4     | 1            |             | 4        |
| 45 | Tecnologías multimedia                                                 | 6.0      | optativa    | 4     | 1            |             | 4        |
| 46 | Análisis y planificación de las TI                                     | 6.0      | optativa    | 4     | 2            |             | 4        |
| 47 | Desarrollo Rápido de Aplicaciones                                      | 6.0      | optativa    | 4     | 2            |             | 4        |
| 48 | Gestión de la Calidad y de la Innovación Tecnológica                   | 6.0      | optativa    | 4     | 2            |             | 4        |
| 49 | Inteligencia del Negocio                                               | 6.0      | optativa    | 4     | 2            |             | 4        |
| 50 | Procesos de Ingeniería del Software 2                                  | 6.0      | optativa    | 4     | 2            |             | 4        |
| 51 | Seguridad Informática                                                  | 6.0      | optativa    | 4     | 2            |             | 4        |


3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
```sql
select p.apellido1, p.apellido2, p.nombre, d.nombre as nombre_departamento from persona as p join profesor as pro on p.id = pro.id_profesor join departamento as d on pro.id_departamento = d.id order by p.apellido1, p.apellido2, p.nombre;
```
| apellido1  | apellido2  |  nombre   | nombre_departamento |
|------------|------------|-----------|---------------------|
| Fahey      | Considine  | Antonio   | Economía y Empresa  |
| Hamill     | Kozey      | Manolo    | Informática         |
| Kohler     | Schoen     | Alejandro | Matemáticas         |
| Lemke      | Rutherford | Cristina  | Economía y Empresa  |
| Monahan    | Murray     | Micaela   | Agronomía           |
| Ramirez    | Gea        | Zoe       | Informática         |
| Ruecker    | Upton      | Guillermo | Educación           |
| Schmidt    | Fisher     | David     | Matemáticas         |
| Schowalter | Muller     | Francesca | Química y Física    |
| Spencer    | Lakin      | Esther    | Educación           |
| Stiedemann | Morissette | Alfredo   | Química y Física    |
| Streich    | Hirthe     | Carmen    | Educación           |


4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
```sql
select asig.nombre, c.anyo_inicio, c.anyo_fin from asignatura as asig join alumno_se_matricula_asignatura as a on asig.id = a.id_asignatura join persona as p on p.id = a.id_alumno join curso_escolar as c on a.id_curso_escolar = c.id where p.nif = '26902806M';
```
|                nombre                | anyo_inicio | anyo_fin |
|--------------------------------------|-------------|----------|
| Álgegra lineal y matemática discreta | 2014        | 2015     |
| Cálculo                              | 2014        | 2015     |
| Física para informática              | 2014        | 2015     |

      
5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
```sql
select distinct d.nombre from departamento as d join profesor as pro on d.id = pro.id_departamento join asignatura as asig on pro.id_profesor = asig.id_profesor join grado as g on g.id = asig.id_grado where g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
```
|   nombre    |
|-------------|
| Informática |


6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
```sql
select distinct p.* from persona as p join alumno_se_matricula_asignatura as a on p.id = a.id_alumno join curso_escolar as c on a.id_curso_escolar = c.id where anyo_inicio = '2018' and anyo_fin = '2019';
```
| id |    nif    | nombre | apellido1 | apellido2 | ciudad  |     direccion      | telefono  | fecha_nacimiento | sexo |  tipo  |
|----|-----------|--------|-----------|-----------|---------|--------------------|-----------|------------------|------|--------|
| 24 | 85135690V | Sonia  | Gea       | Ruiz      | Almería | C/ Mercurio        | 678812017 | 1995/04/13       | M    | alumno |
| 23 | 64753215G | Irene  | Hernández | Martínez  | Almería | C/ Zapillo         | 628452384 | 1996/03/12       | M    | alumno |
| 19 | 11578526G | Inma   | Lakin     | Yundt     | Almería | C/ Picos de Europa | 678652431 | 1998/09/01       | M    | alumno |


## Consultas multitabla (Where)

1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
```sql
select count(pro.id_profesor) from persona as p, profesor as pro, departamento as d where p.id = pro.id_profesor and d.id = pro.id_departamento;


select id_profesor from profesor where id_profesor not in (select p.id from persona as p, profesor as pro, departamento as d where p.id = pro.id_profesor and d.id = pro.id_departamento);

select count(pro.id_profesor) from persona as p join profesor as pro on p.id = pro.id_profesor left join departamento as d on pro.id_departamento = d.id;



```

2. Devuelve un listado con los profesores que no están asociados a un departamento.
    
3. Devuelve un listado con los departamentos que no tienen profesores asociados.

4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.


## Consultas resúmen (Funciones)

1. Devuelve el número total de alumnas que hay.

2. Calcula cuántos alumnos nacieron en 1999.

3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.

8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

## Subconsultas

1. Devuelve todos los datos del alumno más joven.
```sql
select * from persona as p where tipo = 'alumno' and fecha_nacimiento = (select max(fecha_nacimiento) from persona where tipo = 'alumno');
```
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬───────────────────┬──────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion     │ telefono │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼───────────────────┼──────────┼──────────────────┼──────┼────────┤
│ 4  │ 17105885A │ Pedro  │ Heller    │ Pagac     │ Almería │ C/ Estrella fugaz │          │ 2000/10/05       │ H    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴───────────────────┴──────────┴──────────────────┴──────┴────────┘

2. Devuelve un listado con los profesores que no están asociados a un departamento.
```sql
select * from persona where tipo = 'profesor' and id not in (select id_profesor from profesor);
```
> No devuelve tabla pues no hay resultados para la consulta.

3. Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql
select * from departamento where id not in (select id_departamento from profesor);
```
┌────┬─────────────────────┐
│ id │       nombre        │
├────┼─────────────────────┤
│ 7  │ Filología           │
│ 8  │ Derecho             │
│ 9  │ Biología y Geología │
└────┴─────────────────────┘

    
4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
```sql
select p.* from persona as p join asignatura
```

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
    
6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

</div>