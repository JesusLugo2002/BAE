# Ejercicios de relaciones (Inner Join y Where)

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Consultas

#### 1. Proporciona una consulta que muestre solo los clientes de Brasil.
```sql
select * from costumers where country = 'Brazil';
```
| CustomerId | FirstName | LastName  |                     Company                      |             Address             |        City         | State | Country | PostalCode |       Phone        |        Fax         |             Email             | SupportRepId |
|------------|-----------|-----------|--------------------------------------------------|---------------------------------|---------------------|-------|---------|------------|--------------------|--------------------|-------------------------------|--------------|
| 1          | Luís      | Gonçalves | Embraer - Empresa Brasileira de Aeronáutica S.A. | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP    | Brazil  | 12227-000  | +55 (12) 3923-5555 | +55 (12) 3923-5566 | luisg@embraer.com.br          | 3            |
| 10         | Eduardo   | Martins   | Woodstock Discos                                 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP    | Brazil  | 01007-010  | +55 (11) 3033-5446 | +55 (11) 3033-4564 | eduardo@woodstock.com.br      | 4            |
| 11         | Alexandre | Rocha     | Banco do Brasil S.A.                             | Av. Paulista, 2022              | São Paulo           | SP    | Brazil  | 01310-200  | +55 (11) 3055-3278 | +55 (11) 3055-8131 | alero@uol.com.br              | 5            |
| 12         | Roberto   | Almeida   | Riotur                                           | Praça Pio X, 119                | Rio de Janeiro      | RJ    | Brazil  | 20040-020  | +55 (21) 2271-7000 | +55 (21) 2271-7070 | roberto.almeida@riotur.gov.br | 3            |
| 13         | Fernanda  | Ramos     |                                                  | Qe 7 Bloco G                    | Brasília            | DF    | Brazil  | 71020-677  | +55 (61) 3363-5547 | +55 (61) 3363-7855 | fernadaramos4@uol.com.br      | 4            |

#### 2. Proporciona una consulta que muestre las facturas de clientes que son de Brasil.
  La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura
  y país de facturación.

```sql
select c.FirstName || ' ' || c.LastName as CustomersName, i.InvoiceId, i.InvoiceDate, i.BillingCountry from customers as c, invoices as i where c.CustomerId = i.CustomerId and c.Country = 'Brazil'; -- Versión WHERE

select c.FirstName || ' ' || c.LastName as CustomersName, i.InvoiceId, i.InvoiceDate, i.BillingCountry from customers as c join invoices as i on c.CustomerId = i.CustomerID where c.Country = 'Brazil'; -- Versión JOIN
```
|  CustomersName  | InvoiceId |     InvoiceDate     | BillingCountry |
|-----------------|-----------|---------------------|----------------|
| Luís Gonçalves  | 98        | 2010-03-11 00:00:00 | Brazil         |
| Luís Gonçalves  | 121       | 2010-06-13 00:00:00 | Brazil         |
| Luís Gonçalves  | 143       | 2010-09-15 00:00:00 | Brazil         |
| Luís Gonçalves  | 195       | 2011-05-06 00:00:00 | Brazil         |
| Luís Gonçalves  | 316       | 2012-10-27 00:00:00 | Brazil         |
| Luís Gonçalves  | 327       | 2012-12-07 00:00:00 | Brazil         |
| Luís Gonçalves  | 382       | 2013-08-07 00:00:00 | Brazil         |
| Eduardo Martins | 25        | 2009-04-09 00:00:00 | Brazil         |
| Eduardo Martins | 154       | 2010-11-14 00:00:00 | Brazil         |
| Eduardo Martins | 177       | 2011-02-16 00:00:00 | Brazil         |
| Eduardo Martins | 199       | 2011-05-21 00:00:00 | Brazil         |
| Eduardo Martins | 251       | 2012-01-09 00:00:00 | Brazil         |
| Eduardo Martins | 372       | 2013-07-02 00:00:00 | Brazil         |
| Eduardo Martins | 383       | 2013-08-12 00:00:00 | Brazil         |
| Alexandre Rocha | 57        | 2009-09-06 00:00:00 | Brazil         |
| Alexandre Rocha | 68        | 2009-10-17 00:00:00 | Brazil         |
| Alexandre Rocha | 123       | 2010-06-17 00:00:00 | Brazil         |
| Alexandre Rocha | 252       | 2012-01-22 00:00:00 | Brazil         |
| Alexandre Rocha | 275       | 2012-04-25 00:00:00 | Brazil         |
| Alexandre Rocha | 297       | 2012-07-28 00:00:00 | Brazil         |
| Alexandre Rocha | 349       | 2013-03-18 00:00:00 | Brazil         |
| Roberto Almeida | 34        | 2009-05-23 00:00:00 | Brazil         |
| Roberto Almeida | 155       | 2010-11-14 00:00:00 | Brazil         |
| Roberto Almeida | 166       | 2010-12-25 00:00:00 | Brazil         |
| Roberto Almeida | 221       | 2011-08-25 00:00:00 | Brazil         |
| Roberto Almeida | 350       | 2013-03-31 00:00:00 | Brazil         |
| Roberto Almeida | 373       | 2013-07-03 00:00:00 | Brazil         |
| Roberto Almeida | 395       | 2013-10-05 00:00:00 | Brazil         |
| Fernanda Ramos  | 35        | 2009-06-05 00:00:00 | Brazil         |
| Fernanda Ramos  | 58        | 2009-09-07 00:00:00 | Brazil         |
| Fernanda Ramos  | 80        | 2009-12-10 00:00:00 | Brazil         |
| Fernanda Ramos  | 132       | 2010-07-31 00:00:00 | Brazil         |
| Fernanda Ramos  | 253       | 2012-01-22 00:00:00 | Brazil         |
| Fernanda Ramos  | 264       | 2012-03-03 00:00:00 | Brazil         |
| Fernanda Ramos  | 319       | 2012-11-01 00:00:00 | Brazil         |

#### 3. Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.
```sql
select * from employees where title = 'Sales Support Manager';
```
| EmployeeId | LastName | FirstName |        Title        | ReportsTo |      BirthDate      |      HireDate       |     Address      |  City   | State | Country | PostalCode |       Phone       |        Fax        |          Email           |
|------------|----------|-----------|---------------------|-----------|---------------------|---------------------|------------------|---------|-------|---------|------------|-------------------|-------------------|--------------------------|
| 3          | Peacock  | Jane      | Sales Support Agent | 2         | 1973-08-29 00:00:00 | 2002-04-01 00:00:00 | 1111 6 Ave SW    | Calgary | AB    | Canada  | T2P 5M5    | +1 (403) 262-3443 | +1 (403) 262-6712 | jane@chinookcorp.com     |
| 4          | Park     | Margaret  | Sales Support Agent | 2         | 1947-09-19 00:00:00 | 2003-05-03 00:00:00 | 683 10 Street SW | Calgary | AB    | Canada  | T2P 5G3    | +1 (403) 263-4423 | +1 (403) 263-4289 | margaret@chinookcorp.com |
| 5          | Johnson  | Steve     | Sales Support Agent | 2         | 1965-03-03 00:00:00 | 2003-10-17 00:00:00 | 7727B 41 Ave     | Calgary | AB    | Canada  | T3B 1Y7    | 1 (780) 836-9987  | 1 (780) 836-9543  | steve@chinookcorp.com    |


#### 4. Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.
```sql
select distinct BillingCountry as UniquesBillingCountries from Invoices;
```
| UniquesBillingCountries |
|-----------------------|
| Germany               |
| Norway                |
| Belgium               |
| Canada                |
| USA                   |
| France                |
| Ireland               |
| United Kingdom        |
| Australia             |
| Chile                 |
| India                 |
| Brazil                |
| Portugal              |
| Netherlands           |
| Spain                 |
| Sweden                |
| Czech Republic        |
| Finland               |
| Denmark               |
| Italy                 |
| Poland                |
| Austria               |
| Hungary               |
| Argentina             |


#### 5. Proporciona una consulta que muestre las facturas de clientes que son de Brasil.
```sql
select i.* from Invoices as i, Customers as c where c.CustomerId = i.CustomerId and c.Country = 'Brazil'; -- Versión WHERE

select i.* from Invoices as i join Customers as c on c.CustomerId = i.CustomerId where c.Country = 'Brazil'; -- VVersión JOIN
```
| InvoiceId | CustomerId |     InvoiceDate     |         BillingAddress          |     BillingCity     | BillingState | BillingCountry | BillingPostalCode | Total |
|-----------|------------|---------------------|---------------------------------|---------------------|--------------|----------------|-------------------|-------|
| 98        | 1          | 2010-03-11 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 3.98  |
| 121       | 1          | 2010-06-13 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 3.96  |
| 143       | 1          | 2010-09-15 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 5.94  |
| 195       | 1          | 2011-05-06 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 0.99  |
| 316       | 1          | 2012-10-27 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 1.98  |
| 327       | 1          | 2012-12-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 13.86 |
| 382       | 1          | 2013-08-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 8.91  |
| 25        | 10         | 2009-04-09 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 8.91  |
| 154       | 10         | 2010-11-14 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 1.98  |
| 177       | 10         | 2011-02-16 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 3.96  |
| 199       | 10         | 2011-05-21 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 5.94  |
| 251       | 10         | 2012-01-09 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 0.99  |
| 372       | 10         | 2013-07-02 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 1.98  |
| 383       | 10         | 2013-08-12 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 13.86 |
| 57        | 11         | 2009-09-06 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 1.98  |
| 68        | 11         | 2009-10-17 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 13.86 |
| 123       | 11         | 2010-06-17 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 8.91  |
| 252       | 11         | 2012-01-22 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 1.98  |
| 275       | 11         | 2012-04-25 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 3.96  |
| 297       | 11         | 2012-07-28 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 5.94  |
| 349       | 11         | 2013-03-18 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 0.99  |
| 34        | 12         | 2009-05-23 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 0.99  |
| 155       | 12         | 2010-11-14 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| 166       | 12         | 2010-12-25 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 13.86 |
| 221       | 12         | 2011-08-25 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 8.91  |
| 350       | 12         | 2013-03-31 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| 373       | 12         | 2013-07-03 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 3.96  |
| 395       | 12         | 2013-10-05 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 5.94  |
| 35        | 13         | 2009-06-05 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 1.98  |
| 58        | 13         | 2009-09-07 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 3.96  |
| 80        | 13         | 2009-12-10 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 5.94  |
| 132       | 13         | 2010-07-31 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 0.99  |
| 253       | 13         | 2012-01-22 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 1.98  |
| 264       | 13         | 2012-03-03 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 13.86 |
| 319       | 13         | 2012-11-01 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 8.91  |

#### 6. Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.
```sql
select e.LastName || ' ' || e.FirstName as EmployeeName, i.* from Invoices as i, Employees as e, Customers as c where e.EmployeeId = c.SupportRepId and c.CustomerId = i.CustomerId where e.Title = 'Sales Support Agent'; -- Versión WHERE

select e.LastName || ' ' || e.FirstName as EmployeeName, i.* from Employees as e join Customers as c on e.EmployeeId = c.SupportRepId join Invoices as i on i.CustomerId = c.CustomerId where e.Title = 'Sales Support Agent' -- Versión JOIN;
```
| EmployeeName  | InvoiceId | CustomerId |     InvoiceDate     |              BillingAddress              |     BillingCity     | BillingState | BillingCountry | BillingPostalCode | Total |
|---------------|-----------|------------|---------------------|------------------------------------------|---------------------|--------------|----------------|-------------------|-------|
| Peacock Jane  | 98        | 1          | 2010-03-11 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 3.98  |
| Peacock Jane  | 121       | 1          | 2010-06-13 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 3.96  |
| Peacock Jane  | 143       | 1          | 2010-09-15 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 5.94  |
| Peacock Jane  | 195       | 1          | 2011-05-06 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 0.99  |
| Peacock Jane  | 316       | 1          | 2012-10-27 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 1.98  |
| Peacock Jane  | 327       | 1          | 2012-12-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 13.86 |
| Peacock Jane  | 382       | 1          | 2013-08-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 8.91  |
| Peacock Jane  | 99        | 3          | 2010-03-11 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 3.98  |
| Peacock Jane  | 110       | 3          | 2010-04-21 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 13.86 |
| Peacock Jane  | 165       | 3          | 2010-12-20 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 8.91  |
| Peacock Jane  | 294       | 3          | 2012-07-26 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 1.98  |
| Peacock Jane  | 317       | 3          | 2012-10-28 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 3.96  |
| Peacock Jane  | 339       | 3          | 2013-01-30 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 5.94  |
| Peacock Jane  | 391       | 3          | 2013-09-20 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 0.99  |
| Peacock Jane  | 34        | 12         | 2009-05-23 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 0.99  |
| Peacock Jane  | 155       | 12         | 2010-11-14 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| Peacock Jane  | 166       | 12         | 2010-12-25 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 13.86 |
| Peacock Jane  | 221       | 12         | 2011-08-25 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 8.91  |
| Peacock Jane  | 350       | 12         | 2013-03-31 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| Peacock Jane  | 373       | 12         | 2013-07-03 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 3.96  |
| Peacock Jane  | 395       | 12         | 2013-10-05 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 5.94  |
| Peacock Jane  | 36        | 15         | 2009-06-05 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 1.98  |
| Peacock Jane  | 47        | 15         | 2009-07-16 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 13.86 |
| Peacock Jane  | 102       | 15         | 2010-03-16 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 9.91  |
| Peacock Jane  | 231       | 15         | 2011-10-21 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 1.98  |
| Peacock Jane  | 254       | 15         | 2012-01-23 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 3.96  |
| Peacock Jane  | 276       | 15         | 2012-04-26 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 5.94  |
| Peacock Jane  | 328       | 15         | 2012-12-15 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 0.99  |
| Peacock Jane  | 112       | 18         | 2010-05-12 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 1.98  |
| Peacock Jane  | 135       | 18         | 2010-08-14 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 3.96  |
| Peacock Jane  | 157       | 18         | 2010-11-16 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 5.94  |
| Peacock Jane  | 209       | 18         | 2011-07-07 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 0.99  |
| Peacock Jane  | 330       | 18         | 2012-12-28 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 1.98  |
| Peacock Jane  | 341       | 18         | 2013-02-07 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 13.86 |
| Peacock Jane  | 396       | 18         | 2013-10-08 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 8.91  |
| Peacock Jane  | 15        | 19         | 2009-03-04 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 1.98  |
| Peacock Jane  | 26        | 19         | 2009-04-14 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 13.86 |
| Peacock Jane  | 81        | 19         | 2009-12-13 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 8.91  |
| Peacock Jane  | 210       | 19         | 2011-07-20 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 1.98  |
| Peacock Jane  | 233       | 19         | 2011-10-22 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 3.96  |
| Peacock Jane  | 255       | 19         | 2012-01-24 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 5.94  |
| Peacock Jane  | 307       | 19         | 2012-09-13 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 1.99  |
| Peacock Jane  | 92        | 24         | 2010-02-08 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 1.98  |
| Peacock Jane  | 103       | 24         | 2010-03-21 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 15.86 |
| Peacock Jane  | 158       | 24         | 2010-11-19 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 8.91  |
| Peacock Jane  | 287       | 24         | 2012-06-25 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 1.98  |
| Peacock Jane  | 310       | 24         | 2012-09-27 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 7.96  |
| Peacock Jane  | 332       | 24         | 2012-12-30 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 5.94  |
| Peacock Jane  | 384       | 24         | 2013-08-20 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 0.99  |
| Peacock Jane  | 48        | 29         | 2009-07-24 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 0.99  |
| Peacock Jane  | 169       | 29         | 2011-01-15 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 1.98  |
| Peacock Jane  | 180       | 29         | 2011-02-25 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 13.86 |
| Peacock Jane  | 235       | 29         | 2011-10-26 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 8.91  |
| Peacock Jane  | 364       | 29         | 2013-06-01 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 1.98  |
| Peacock Jane  | 387       | 29         | 2013-09-03 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 3.96  |
| Peacock Jane  | 409       | 29         | 2013-12-06 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 5.94  |
| Peacock Jane  | 49        | 30         | 2009-08-06 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 1.98  |
| Peacock Jane  | 72        | 30         | 2009-11-08 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 3.96  |
| Peacock Jane  | 94        | 30         | 2010-02-10 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 5.94  |
| Peacock Jane  | 146       | 30         | 2010-10-01 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 0.99  |
| Peacock Jane  | 267       | 30         | 2012-03-24 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 1.98  |
| Peacock Jane  | 278       | 30         | 2012-05-04 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 13.86 |
| Peacock Jane  | 333       | 30         | 2013-01-02 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 8.91  |
| Peacock Jane  | 27        | 33         | 2009-04-22 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 0.99  |
| Peacock Jane  | 148       | 33         | 2010-10-14 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 1.98  |
| Peacock Jane  | 159       | 33         | 2010-11-24 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 13.86 |
| Peacock Jane  | 214       | 33         | 2011-07-25 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 8.91  |
| Peacock Jane  | 343       | 33         | 2013-02-28 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 1.98  |
| Peacock Jane  | 366       | 33         | 2013-06-02 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 3.96  |
| Peacock Jane  | 388       | 33         | 2013-09-04 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 5.94  |
| Peacock Jane  | 6         | 37         | 2009-01-19 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 0.99  |
| Peacock Jane  | 127       | 37         | 2010-07-13 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 1.98  |
| Peacock Jane  | 138       | 37         | 2010-08-23 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 13.86 |
| Peacock Jane  | 193       | 37         | 2011-04-23 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 14.91 |
| Peacock Jane  | 322       | 37         | 2012-11-27 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 1.98  |
| Peacock Jane  | 345       | 37         | 2013-03-01 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 3.96  |
| Peacock Jane  | 367       | 37         | 2013-06-03 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 5.94  |
| Peacock Jane  | 7         | 38         | 2009-02-01 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 1.98  |
| Peacock Jane  | 30        | 38         | 2009-05-06 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 3.96  |
| Peacock Jane  | 52        | 38         | 2009-08-08 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 5.94  |
| Peacock Jane  | 104       | 38         | 2010-03-29 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 0.99  |
| Peacock Jane  | 225       | 38         | 2011-09-20 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 1.98  |
| Peacock Jane  | 236       | 38         | 2011-10-31 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 13.86 |
| Peacock Jane  | 291       | 38         | 2012-06-30 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 8.91  |
| Peacock Jane  | 9         | 42         | 2009-02-02 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 3.96  |
| Peacock Jane  | 31        | 42         | 2009-05-07 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 5.94  |
| Peacock Jane  | 83        | 42         | 2009-12-26 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 0.99  |
| Peacock Jane  | 204       | 42         | 2011-06-19 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 3.98  |
| Peacock Jane  | 215       | 42         | 2011-07-30 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 13.86 |
| Peacock Jane  | 270       | 42         | 2012-03-29 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 8.91  |
| Peacock Jane  | 399       | 42         | 2013-11-03 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 1.98  |
| Peacock Jane  | 84        | 43         | 2010-01-08 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 1.98  |
| Peacock Jane  | 107       | 43         | 2010-04-12 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 3.96  |
| Peacock Jane  | 129       | 43         | 2010-07-15 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 5.94  |
| Peacock Jane  | 181       | 43         | 2011-03-05 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 0.99  |
| Peacock Jane  | 302       | 43         | 2012-08-26 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 1.98  |
| Peacock Jane  | 313       | 43         | 2012-10-06 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 16.86 |
| Peacock Jane  | 368       | 43         | 2013-06-06 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 8.91  |
| Peacock Jane  | 53        | 44         | 2009-08-11 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 8.91  |
| Peacock Jane  | 182       | 44         | 2011-03-18 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 1.98  |
| Peacock Jane  | 205       | 44         | 2011-06-20 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 7.96  |
| Peacock Jane  | 227       | 44         | 2011-09-22 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 5.94  |
| Peacock Jane  | 279       | 44         | 2012-05-12 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 0.99  |
| Peacock Jane  | 400       | 44         | 2013-11-03 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 1.98  |
| Peacock Jane  | 411       | 44         | 2013-12-14 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 13.86 |
| Peacock Jane  | 85        | 45         | 2010-01-08 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 1.98  |
| Peacock Jane  | 96        | 45         | 2010-02-18 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 21.86 |
| Peacock Jane  | 151       | 45         | 2010-10-19 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 8.91  |
| Peacock Jane  | 280       | 45         | 2012-05-25 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 1.98  |
| Peacock Jane  | 303       | 45         | 2012-08-27 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 3.96  |
| Peacock Jane  | 325       | 45         | 2012-11-29 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 5.94  |
| Peacock Jane  | 377       | 45         | 2013-07-20 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 0.99  |
| Peacock Jane  | 10        | 46         | 2009-02-03 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 5.94  |
| Peacock Jane  | 62        | 46         | 2009-09-24 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 0.99  |
| Peacock Jane  | 183       | 46         | 2011-03-18 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 1.98  |
| Peacock Jane  | 194       | 46         | 2011-04-28 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 21.86 |
| Peacock Jane  | 249       | 46         | 2011-12-27 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 8.91  |
| Peacock Jane  | 378       | 46         | 2013-08-02 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 1.98  |
| Peacock Jane  | 401       | 46         | 2013-11-04 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 3.96  |
| Peacock Jane  | 11        | 52         | 2009-02-06 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 8.91  |
| Peacock Jane  | 140       | 52         | 2010-09-13 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 1.98  |
| Peacock Jane  | 163       | 52         | 2010-12-16 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 3.96  |
| Peacock Jane  | 185       | 52         | 2011-03-20 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 5.94  |
| Peacock Jane  | 237       | 52         | 2011-11-08 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 0.99  |
| Peacock Jane  | 358       | 52         | 2013-05-01 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 1.98  |
| Peacock Jane  | 369       | 52         | 2013-06-11 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 13.86 |
| Peacock Jane  | 43        | 53         | 2009-07-06 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 1.98  |
| Peacock Jane  | 54        | 53         | 2009-08-16 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 13.86 |
| Peacock Jane  | 109       | 53         | 2010-04-16 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 8.91  |
| Peacock Jane  | 238       | 53         | 2011-11-21 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 1.98  |
| Peacock Jane  | 261       | 53         | 2012-02-23 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 3.96  |
| Peacock Jane  | 283       | 53         | 2012-05-27 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 5.94  |
| Peacock Jane  | 335       | 53         | 2013-01-15 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 0.99  |
| Peacock Jane  | 120       | 58         | 2010-06-12 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 1.98  |
| Peacock Jane  | 131       | 58         | 2010-07-23 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 13.86 |
| Peacock Jane  | 186       | 58         | 2011-03-23 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 8.91  |
| Peacock Jane  | 315       | 58         | 2012-10-27 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 1.98  |
| Peacock Jane  | 338       | 58         | 2013-01-29 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 3.96  |
| Peacock Jane  | 360       | 58         | 2013-05-03 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 5.94  |
| Peacock Jane  | 412       | 58         | 2013-12-22 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 1.99  |
| Peacock Jane  | 23        | 59         | 2009-04-05 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 3.96  |
| Peacock Jane  | 45        | 59         | 2009-07-08 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 5.94  |
| Peacock Jane  | 97        | 59         | 2010-02-26 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 1.99  |
| Peacock Jane  | 218       | 59         | 2011-08-20 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 1.98  |
| Peacock Jane  | 229       | 59         | 2011-09-30 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 13.86 |
| Peacock Jane  | 284       | 59         | 2012-05-30 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 8.91  |
| Park Margaret | 2         | 4          | 2009-01-02 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 3.96  |
| Park Margaret | 24        | 4          | 2009-04-06 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 5.94  |
| Park Margaret | 76        | 4          | 2009-11-25 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 0.99  |
| Park Margaret | 197       | 4          | 2011-05-19 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 1.98  |
| Park Margaret | 208       | 4          | 2011-06-29 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 15.86 |
| Park Margaret | 263       | 4          | 2012-02-27 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 8.91  |
| Park Margaret | 392       | 4          | 2013-10-03 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 1.98  |
| Park Margaret | 77        | 5          | 2009-12-08 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 1.98  |
| Park Margaret | 100       | 5          | 2010-03-12 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 3.96  |
| Park Margaret | 122       | 5          | 2010-06-14 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 5.94  |
| Park Margaret | 174       | 5          | 2011-02-02 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 0.99  |
| Park Margaret | 295       | 5          | 2012-07-26 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 1.98  |
| Park Margaret | 306       | 5          | 2012-09-05 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 16.86 |
| Park Margaret | 361       | 5          | 2013-05-06 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 8.91  |
| Park Margaret | 3         | 8          | 2009-01-03 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 5.94  |
| Park Margaret | 55        | 8          | 2009-08-24 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 0.99  |
| Park Margaret | 176       | 8          | 2011-02-15 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 1.98  |
| Park Margaret | 187       | 8          | 2011-03-28 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 13.86 |
| Park Margaret | 242       | 8          | 2011-11-26 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 8.91  |
| Park Margaret | 371       | 8          | 2013-07-02 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 1.98  |
| Park Margaret | 394       | 8          | 2013-10-04 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 3.96  |
| Park Margaret | 56        | 9          | 2009-09-06 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 1.98  |
| Park Margaret | 79        | 9          | 2009-12-09 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 3.96  |
| Park Margaret | 101       | 9          | 2010-03-13 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 5.94  |
| Park Margaret | 153       | 9          | 2010-11-01 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 0.99  |
| Park Margaret | 274       | 9          | 2012-04-24 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 1.98  |
| Park Margaret | 285       | 9          | 2012-06-04 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 13.86 |
| Park Margaret | 340       | 9          | 2013-02-02 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 8.91  |
| Park Margaret | 25        | 10         | 2009-04-09 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 8.91  |
| Park Margaret | 154       | 10         | 2010-11-14 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 1.98  |
| Park Margaret | 177       | 10         | 2011-02-16 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 3.96  |
| Park Margaret | 199       | 10         | 2011-05-21 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 5.94  |
| Park Margaret | 251       | 10         | 2012-01-09 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 0.99  |
| Park Margaret | 372       | 10         | 2013-07-02 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 1.98  |
| Park Margaret | 383       | 10         | 2013-08-12 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 13.86 |
| Park Margaret | 35        | 13         | 2009-06-05 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 1.98  |
| Park Margaret | 58        | 13         | 2009-09-07 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 3.96  |
| Park Margaret | 80        | 13         | 2009-12-10 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 5.94  |
| Park Margaret | 132       | 13         | 2010-07-31 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 0.99  |
| Park Margaret | 253       | 13         | 2012-01-22 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 1.98  |
| Park Margaret | 264       | 13         | 2012-03-03 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 13.86 |
| Park Margaret | 319       | 13         | 2012-11-01 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 8.91  |
| Park Margaret | 13        | 16         | 2009-02-19 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 0.99  |
| Park Margaret | 134       | 16         | 2010-08-13 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 1.98  |
| Park Margaret | 145       | 16         | 2010-09-23 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 13.86 |
| Park Margaret | 200       | 16         | 2011-05-24 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 8.91  |
| Park Margaret | 329       | 16         | 2012-12-28 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 1.98  |
| Park Margaret | 352       | 16         | 2013-04-01 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 3.96  |
| Park Margaret | 374       | 16         | 2013-07-04 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 5.94  |
| Park Margaret | 113       | 20         | 2010-05-12 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 1.98  |
| Park Margaret | 124       | 20         | 2010-06-22 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 13.86 |
| Park Margaret | 179       | 20         | 2011-02-20 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 8.91  |
| Park Margaret | 308       | 20         | 2012-09-26 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 3.98  |
| Park Margaret | 331       | 20         | 2012-12-29 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 3.96  |
| Park Margaret | 353       | 20         | 2013-04-02 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 5.94  |
| Park Margaret | 405       | 20         | 2013-11-21 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 0.99  |
| Park Margaret | 91        | 22         | 2010-02-08 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 1.98  |
| Park Margaret | 114       | 22         | 2010-05-13 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 3.96  |
| Park Margaret | 136       | 22         | 2010-08-15 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 5.94  |
| Park Margaret | 188       | 22         | 2011-04-05 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 0.99  |
| Park Margaret | 309       | 22         | 2012-09-26 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 3.98  |
| Park Margaret | 320       | 22         | 2012-11-06 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 13.86 |
| Park Margaret | 375       | 22         | 2013-07-07 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 8.91  |
| Park Margaret | 5         | 23         | 2009-01-11 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 13.86 |
| Park Margaret | 60        | 23         | 2009-09-11 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 8.91  |
| Park Margaret | 189       | 23         | 2011-04-18 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 1.98  |
| Park Margaret | 212       | 23         | 2011-07-21 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 3.96  |
| Park Margaret | 234       | 23         | 2011-10-23 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 5.94  |
| Park Margaret | 286       | 23         | 2012-06-12 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 0.99  |
| Park Margaret | 407       | 23         | 2013-12-04 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 1.98  |
| Park Margaret | 70        | 26         | 2009-11-07 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 1.98  |
| Park Margaret | 93        | 26         | 2010-02-09 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 3.96  |
| Park Margaret | 115       | 26         | 2010-05-14 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 5.94  |
| Park Margaret | 167       | 26         | 2011-01-02 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 0.99  |
| Park Margaret | 288       | 26         | 2012-06-25 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 1.98  |
| Park Margaret | 299       | 26         | 2012-08-05 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 23.86 |
| Park Margaret | 354       | 26         | 2013-04-05 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 8.91  |
| Park Margaret | 39        | 27         | 2009-06-10 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 8.91  |
| Park Margaret | 168       | 27         | 2011-01-15 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 1.98  |
| Park Margaret | 191       | 27         | 2011-04-19 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 3.96  |
| Park Margaret | 213       | 27         | 2011-07-22 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 5.94  |
| Park Margaret | 265       | 27         | 2012-03-11 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 0.99  |
| Park Margaret | 386       | 27         | 2013-09-02 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 1.98  |
| Park Margaret | 397       | 27         | 2013-10-13 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 13.86 |
| Park Margaret | 50        | 32         | 2009-08-06 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 1.98  |
| Park Margaret | 61        | 32         | 2009-09-16 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 13.86 |
| Park Margaret | 116       | 32         | 2010-05-17 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 8.91  |
| Park Margaret | 245       | 32         | 2011-12-22 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 1.98  |
| Park Margaret | 268       | 32         | 2012-03-25 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 3.96  |
| Park Margaret | 290       | 32         | 2012-06-27 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 5.94  |
| Park Margaret | 342       | 32         | 2013-02-15 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 0.99  |
| Park Margaret | 28        | 34         | 2009-05-05 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 1.98  |
| Park Margaret | 51        | 34         | 2009-08-07 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 3.96  |
| Park Margaret | 73        | 34         | 2009-11-09 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 5.94  |
| Park Margaret | 125       | 34         | 2010-06-30 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 0.99  |
| Park Margaret | 246       | 34         | 2011-12-22 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 1.98  |
| Park Margaret | 257       | 34         | 2012-02-01 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 13.86 |
| Park Margaret | 312       | 34         | 2012-10-01 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 10.91 |
| Park Margaret | 126       | 35         | 2010-07-13 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 1.98  |
| Park Margaret | 149       | 35         | 2010-10-15 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 3.96  |
| Park Margaret | 171       | 35         | 2011-01-17 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 5.94  |
| Park Margaret | 223       | 35         | 2011-09-07 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 0.99  |
| Park Margaret | 344       | 35         | 2013-02-28 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 1.98  |
| Park Margaret | 355       | 35         | 2013-04-10 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 13.86 |
| Park Margaret | 410       | 35         | 2013-12-09 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 8.91  |
| Park Margaret | 105       | 39         | 2010-04-11 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 1.98  |
| Park Margaret | 128       | 39         | 2010-07-14 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 3.96  |
| Park Margaret | 150       | 39         | 2010-10-16 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 5.94  |
| Park Margaret | 202       | 39         | 2011-06-06 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 1.99  |
| Park Margaret | 323       | 39         | 2012-11-27 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 1.98  |
| Park Margaret | 334       | 39         | 2013-01-07 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 13.86 |
| Park Margaret | 389       | 39         | 2013-09-07 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 8.91  |
| Park Margaret | 8         | 40         | 2009-02-01 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 1.98  |
| Park Margaret | 19        | 40         | 2009-03-14 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 13.86 |
| Park Margaret | 74        | 40         | 2009-11-12 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 8.91  |
| Park Margaret | 203       | 40         | 2011-06-19 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 2.98  |
| Park Margaret | 226       | 40         | 2011-09-21 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 3.96  |
| Park Margaret | 248       | 40         | 2011-12-24 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 5.94  |
| Park Margaret | 300       | 40         | 2012-08-13 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 0.99  |
| Park Margaret | 64        | 49         | 2009-10-07 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 1.98  |
| Park Margaret | 75        | 49         | 2009-11-17 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 13.86 |
| Park Margaret | 130       | 49         | 2010-07-18 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 8.91  |
| Park Margaret | 259       | 49         | 2012-02-22 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 1.98  |
| Park Margaret | 282       | 49         | 2012-05-26 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 3.96  |
| Park Margaret | 304       | 49         | 2012-08-28 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 5.94  |
| Park Margaret | 356       | 49         | 2013-04-18 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 0.99  |
| Park Margaret | 21        | 55         | 2009-04-04 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 1.98  |
| Park Margaret | 44        | 55         | 2009-07-07 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 3.96  |
| Park Margaret | 66        | 55         | 2009-10-09 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 5.94  |
| Park Margaret | 118       | 55         | 2010-05-30 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 0.99  |
| Park Margaret | 239       | 55         | 2011-11-21 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 1.98  |
| Park Margaret | 250       | 55         | 2012-01-01 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 13.86 |
| Park Margaret | 305       | 55         | 2012-08-31 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 8.91  |
| Park Margaret | 119       | 56         | 2010-06-12 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 1.98  |
| Park Margaret | 142       | 56         | 2010-09-14 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 3.96  |
| Park Margaret | 164       | 56         | 2010-12-17 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 5.94  |
| Park Margaret | 216       | 56         | 2011-08-07 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 0.99  |
| Park Margaret | 337       | 56         | 2013-01-28 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 1.98  |
| Park Margaret | 348       | 56         | 2013-03-10 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 13.86 |
| Park Margaret | 403       | 56         | 2013-11-08 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 8.91  |
| Johnson Steve | 1         | 2          | 2009-01-01 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 1.98  |
| Johnson Steve | 12        | 2          | 2009-02-11 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 13.86 |
| Johnson Steve | 67        | 2          | 2009-10-12 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 8.91  |
| Johnson Steve | 196       | 2          | 2011-05-19 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 1.98  |
| Johnson Steve | 219       | 2          | 2011-08-21 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 3.96  |
| Johnson Steve | 241       | 2          | 2011-11-23 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 5.94  |
| Johnson Steve | 293       | 2          | 2012-07-13 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 0.99  |
| Johnson Steve | 46        | 6          | 2009-07-11 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 8.91  |
| Johnson Steve | 175       | 6          | 2011-02-15 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 1.98  |
| Johnson Steve | 198       | 6          | 2011-05-20 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 3.96  |
| Johnson Steve | 220       | 6          | 2011-08-22 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 5.94  |
| Johnson Steve | 272       | 6          | 2012-04-11 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 0.99  |
| Johnson Steve | 393       | 6          | 2013-10-03 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 1.98  |
| Johnson Steve | 404       | 6          | 2013-11-13 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 25.86 |
| Johnson Steve | 78        | 7          | 2009-12-08 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 1.98  |
| Johnson Steve | 89        | 7          | 2010-01-18 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 18.86 |
| Johnson Steve | 144       | 7          | 2010-09-18 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 8.91  |
| Johnson Steve | 273       | 7          | 2012-04-24 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 1.98  |
| Johnson Steve | 296       | 7          | 2012-07-27 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 3.96  |
| Johnson Steve | 318       | 7          | 2012-10-29 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 5.94  |
| Johnson Steve | 370       | 7          | 2013-06-19 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 0.99  |
| Johnson Steve | 57        | 11         | 2009-09-06 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 1.98  |
| Johnson Steve | 68        | 11         | 2009-10-17 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 13.86 |
| Johnson Steve | 123       | 11         | 2010-06-17 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 8.91  |
| Johnson Steve | 252       | 11         | 2012-01-22 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 1.98  |
| Johnson Steve | 275       | 11         | 2012-04-25 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 3.96  |
| Johnson Steve | 297       | 11         | 2012-07-28 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 5.94  |
| Johnson Steve | 349       | 11         | 2013-03-18 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 0.99  |
| Johnson Steve | 4         | 14         | 2009-01-06 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 8.91  |
| Johnson Steve | 133       | 14         | 2010-08-13 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 1.98  |
| Johnson Steve | 156       | 14         | 2010-11-15 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 3.96  |
| Johnson Steve | 178       | 14         | 2011-02-17 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 5.94  |
| Johnson Steve | 230       | 14         | 2011-10-08 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 0.99  |
| Johnson Steve | 351       | 14         | 2013-03-31 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 1.98  |
| Johnson Steve | 362       | 14         | 2013-05-11 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 13.86 |
| Johnson Steve | 14        | 17         | 2009-03-04 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 1.98  |
| Johnson Steve | 37        | 17         | 2009-06-06 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 3.96  |
| Johnson Steve | 59        | 17         | 2009-09-08 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 5.94  |
| Johnson Steve | 111       | 17         | 2010-04-29 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 0.99  |
| Johnson Steve | 232       | 17         | 2011-10-21 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 1.98  |
| Johnson Steve | 243       | 17         | 2011-12-01 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 13.86 |
| Johnson Steve | 298       | 17         | 2012-07-31 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 10.91 |
| Johnson Steve | 16        | 21         | 2009-03-05 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 3.96  |
| Johnson Steve | 38        | 21         | 2009-06-07 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 5.94  |
| Johnson Steve | 90        | 21         | 2010-01-26 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 0.99  |
| Johnson Steve | 211       | 21         | 2011-07-20 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 1.98  |
| Johnson Steve | 222       | 21         | 2011-08-30 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 13.86 |
| Johnson Steve | 277       | 21         | 2012-04-29 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 8.91  |
| Johnson Steve | 406       | 21         | 2013-12-04 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 1.98  |
| Johnson Steve | 17        | 25         | 2009-03-06 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 5.94  |
| Johnson Steve | 69        | 25         | 2009-10-25 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 0.99  |
| Johnson Steve | 190       | 25         | 2011-04-18 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 1.98  |
| Johnson Steve | 201       | 25         | 2011-05-29 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 18.86 |
| Johnson Steve | 256       | 25         | 2012-01-27 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 8.91  |
| Johnson Steve | 385       | 25         | 2013-09-02 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 1.98  |
| Johnson Steve | 408       | 25         | 2013-12-05 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 3.96  |
| Johnson Steve | 71        | 28         | 2009-11-07 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 1.98  |
| Johnson Steve | 82        | 28         | 2009-12-18 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 13.86 |
| Johnson Steve | 137       | 28         | 2010-08-18 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 8.91  |
| Johnson Steve | 266       | 28         | 2012-03-24 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 1.98  |
| Johnson Steve | 289       | 28         | 2012-06-26 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 3.96  |
| Johnson Steve | 311       | 28         | 2012-09-28 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 11.94 |
| Johnson Steve | 363       | 28         | 2013-05-19 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 0.99  |
| Johnson Steve | 18        | 31         | 2009-03-09 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 8.91  |
| Johnson Steve | 147       | 31         | 2010-10-14 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 1.98  |
| Johnson Steve | 170       | 31         | 2011-01-16 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 3.96  |
| Johnson Steve | 192       | 31         | 2011-04-20 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 5.94  |
| Johnson Steve | 244       | 31         | 2011-12-09 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 0.99  |
| Johnson Steve | 365       | 31         | 2013-06-01 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 1.98  |
| Johnson Steve | 376       | 31         | 2013-07-12 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 13.86 |
| Johnson Steve | 29        | 36         | 2009-05-05 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 1.98  |
| Johnson Steve | 40        | 36         | 2009-06-15 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 13.86 |
| Johnson Steve | 95        | 36         | 2010-02-13 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 8.91  |
| Johnson Steve | 224       | 36         | 2011-09-20 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 1.98  |
| Johnson Steve | 247       | 36         | 2011-12-23 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 3.96  |
| Johnson Steve | 269       | 36         | 2012-03-26 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 5.94  |
| Johnson Steve | 321       | 36         | 2012-11-14 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 0.99  |
| Johnson Steve | 106       | 41         | 2010-04-11 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 1.98  |
| Johnson Steve | 117       | 41         | 2010-05-22 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 13.86 |
| Johnson Steve | 172       | 41         | 2011-01-20 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 8.91  |
| Johnson Steve | 301       | 41         | 2012-08-26 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 1.98  |
| Johnson Steve | 324       | 41         | 2012-11-28 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 3.96  |
| Johnson Steve | 346       | 41         | 2013-03-02 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 5.94  |
| Johnson Steve | 398       | 41         | 2013-10-21 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 0.99  |
| Johnson Steve | 63        | 47         | 2009-10-07 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 1.98  |
| Johnson Steve | 86        | 47         | 2010-01-09 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 3.96  |
| Johnson Steve | 108       | 47         | 2010-04-13 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 5.94  |
| Johnson Steve | 160       | 47         | 2010-12-02 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 0.99  |
| Johnson Steve | 281       | 47         | 2012-05-25 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 1.98  |
| Johnson Steve | 292       | 47         | 2012-07-05 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 13.86 |
| Johnson Steve | 347       | 47         | 2013-03-05 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 8.91  |
| Johnson Steve | 32        | 48         | 2009-05-10 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 8.91  |
| Johnson Steve | 161       | 48         | 2010-12-15 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 1.98  |
| Johnson Steve | 184       | 48         | 2011-03-19 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 3.96  |
| Johnson Steve | 206       | 48         | 2011-06-21 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 8.94  |
| Johnson Steve | 258       | 48         | 2012-02-09 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 0.99  |
| Johnson Steve | 379       | 48         | 2013-08-02 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 1.98  |
| Johnson Steve | 390       | 48         | 2013-09-12 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 13.86 |
| Johnson Steve | 41        | 50         | 2009-06-23 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 0.99  |
| Johnson Steve | 162       | 50         | 2010-12-15 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 1.98  |
| Johnson Steve | 173       | 50         | 2011-01-25 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 13.86 |
| Johnson Steve | 228       | 50         | 2011-09-25 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 8.91  |
| Johnson Steve | 357       | 50         | 2013-05-01 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 1.98  |
| Johnson Steve | 380       | 50         | 2013-08-03 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 3.96  |
| Johnson Steve | 402       | 50         | 2013-11-05 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 5.94  |
| Johnson Steve | 42        | 51         | 2009-07-06 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 1.98  |
| Johnson Steve | 65        | 51         | 2009-10-08 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 3.96  |
| Johnson Steve | 87        | 51         | 2010-01-10 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 6.94  |
| Johnson Steve | 139       | 51         | 2010-08-31 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 0.99  |
| Johnson Steve | 260       | 51         | 2012-02-22 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 1.98  |
| Johnson Steve | 271       | 51         | 2012-04-03 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 13.86 |
| Johnson Steve | 326       | 51         | 2012-12-02 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 8.91  |
| Johnson Steve | 20        | 54         | 2009-03-22 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 0.99  |
| Johnson Steve | 141       | 54         | 2010-09-13 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 1.98  |
| Johnson Steve | 152       | 54         | 2010-10-24 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 13.86 |
| Johnson Steve | 207       | 54         | 2011-06-24 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 8.91  |
| Johnson Steve | 336       | 54         | 2013-01-28 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 1.98  |
| Johnson Steve | 359       | 54         | 2013-05-02 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 3.96  |
| Johnson Steve | 381       | 54         | 2013-08-04 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 5.94  |
| Johnson Steve | 22        | 57         | 2009-04-04 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 1.98  |
| Johnson Steve | 33        | 57         | 2009-05-15 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 13.86 |
| Johnson Steve | 88        | 57         | 2010-01-13 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 17.91 |
| Johnson Steve | 217       | 57         | 2011-08-20 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 1.98  |
| Johnson Steve | 240       | 57         | 2011-11-22 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 3.96  |
| Johnson Steve | 262       | 57         | 2012-02-24 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 5.94  |
| Johnson Steve | 314       | 57         | 2012-10-14 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 0.99  |

#### 7. Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.
```sql
select i.total as InvoiceTotal, c.CustomerId, c.FirstName || ' ' || c.LastName as CustomerName, e.Country as EmployeeCountry, e.FirstName || ' ' || e.LastName as EmployeeName from Customers as c, Employees as e, Invoices as i where c.CustomerId = i.CustomerId and e.EmployeeId = c.SupportRepId and e.Title = 'Sales Support Agent'; -- Versión WHERE

select i.total as InvoiceTotal, c.CustomerId, c.FirstName || ' ' || c.LastName as CustomerName, e.Country as EmployeeCountry, e.FirstName || ' ' || e.LastName as EmployeeName from Customers as c join Invoices as i on i.CustomerId = c.CustomerId join Employees as e on c.SupportRepId = e.EmployeeID where e.Title = 'Sales Support Agent'; -- Versión JOIN

```
 InvoiceTotal | CustomerId |     CustomerName      | EmployeeCountry | EmployeeName  |
|--------------|------------|-----------------------|-----------------|---------------|
| 3.98         | 1          | Luís Gonçalves        | Canada          | Jane Peacock  |
| 3.96         | 1          | Luís Gonçalves        | Canada          | Jane Peacock  |
| 5.94         | 1          | Luís Gonçalves        | Canada          | Jane Peacock  |
| 0.99         | 1          | Luís Gonçalves        | Canada          | Jane Peacock  |
| 1.98         | 1          | Luís Gonçalves        | Canada          | Jane Peacock  |
| 13.86        | 1          | Luís Gonçalves        | Canada          | Jane Peacock  |
| 8.91         | 1          | Luís Gonçalves        | Canada          | Jane Peacock  |
| 3.98         | 3          | François Tremblay     | Canada          | Jane Peacock  |
| 13.86        | 3          | François Tremblay     | Canada          | Jane Peacock  |
| 8.91         | 3          | François Tremblay     | Canada          | Jane Peacock  |
| 1.98         | 3          | François Tremblay     | Canada          | Jane Peacock  |
| 3.96         | 3          | François Tremblay     | Canada          | Jane Peacock  |
| 5.94         | 3          | François Tremblay     | Canada          | Jane Peacock  |
| 0.99         | 3          | François Tremblay     | Canada          | Jane Peacock  |
| 0.99         | 12         | Roberto Almeida       | Canada          | Jane Peacock  |
| 1.98         | 12         | Roberto Almeida       | Canada          | Jane Peacock  |
| 13.86        | 12         | Roberto Almeida       | Canada          | Jane Peacock  |
| 8.91         | 12         | Roberto Almeida       | Canada          | Jane Peacock  |
| 1.98         | 12         | Roberto Almeida       | Canada          | Jane Peacock  |
| 3.96         | 12         | Roberto Almeida       | Canada          | Jane Peacock  |
| 5.94         | 12         | Roberto Almeida       | Canada          | Jane Peacock  |
| 1.98         | 15         | Jennifer Peterson     | Canada          | Jane Peacock  |
| 13.86        | 15         | Jennifer Peterson     | Canada          | Jane Peacock  |
| 9.91         | 15         | Jennifer Peterson     | Canada          | Jane Peacock  |
| 1.98         | 15         | Jennifer Peterson     | Canada          | Jane Peacock  |
| 3.96         | 15         | Jennifer Peterson     | Canada          | Jane Peacock  |
| 5.94         | 15         | Jennifer Peterson     | Canada          | Jane Peacock  |
| 0.99         | 15         | Jennifer Peterson     | Canada          | Jane Peacock  |
| 1.98         | 18         | Michelle Brooks       | Canada          | Jane Peacock  |
| 3.96         | 18         | Michelle Brooks       | Canada          | Jane Peacock  |
| 5.94         | 18         | Michelle Brooks       | Canada          | Jane Peacock  |
| 0.99         | 18         | Michelle Brooks       | Canada          | Jane Peacock  |
| 1.98         | 18         | Michelle Brooks       | Canada          | Jane Peacock  |
| 13.86        | 18         | Michelle Brooks       | Canada          | Jane Peacock  |
| 8.91         | 18         | Michelle Brooks       | Canada          | Jane Peacock  |
| 1.98         | 19         | Tim Goyer             | Canada          | Jane Peacock  |
| 13.86        | 19         | Tim Goyer             | Canada          | Jane Peacock  |
| 8.91         | 19         | Tim Goyer             | Canada          | Jane Peacock  |
| 1.98         | 19         | Tim Goyer             | Canada          | Jane Peacock  |
| 3.96         | 19         | Tim Goyer             | Canada          | Jane Peacock  |
| 5.94         | 19         | Tim Goyer             | Canada          | Jane Peacock  |
| 1.99         | 19         | Tim Goyer             | Canada          | Jane Peacock  |
| 1.98         | 24         | Frank Ralston         | Canada          | Jane Peacock  |
| 15.86        | 24         | Frank Ralston         | Canada          | Jane Peacock  |
| 8.91         | 24         | Frank Ralston         | Canada          | Jane Peacock  |
| 1.98         | 24         | Frank Ralston         | Canada          | Jane Peacock  |
| 7.96         | 24         | Frank Ralston         | Canada          | Jane Peacock  |
| 5.94         | 24         | Frank Ralston         | Canada          | Jane Peacock  |
| 0.99         | 24         | Frank Ralston         | Canada          | Jane Peacock  |
| 0.99         | 29         | Robert Brown          | Canada          | Jane Peacock  |
| 1.98         | 29         | Robert Brown          | Canada          | Jane Peacock  |
| 13.86        | 29         | Robert Brown          | Canada          | Jane Peacock  |
| 8.91         | 29         | Robert Brown          | Canada          | Jane Peacock  |
| 1.98         | 29         | Robert Brown          | Canada          | Jane Peacock  |
| 3.96         | 29         | Robert Brown          | Canada          | Jane Peacock  |
| 5.94         | 29         | Robert Brown          | Canada          | Jane Peacock  |
| 1.98         | 30         | Edward Francis        | Canada          | Jane Peacock  |
| 3.96         | 30         | Edward Francis        | Canada          | Jane Peacock  |
| 5.94         | 30         | Edward Francis        | Canada          | Jane Peacock  |
| 0.99         | 30         | Edward Francis        | Canada          | Jane Peacock  |
| 1.98         | 30         | Edward Francis        | Canada          | Jane Peacock  |
| 13.86        | 30         | Edward Francis        | Canada          | Jane Peacock  |
| 8.91         | 30         | Edward Francis        | Canada          | Jane Peacock  |
| 0.99         | 33         | Ellie Sullivan        | Canada          | Jane Peacock  |
| 1.98         | 33         | Ellie Sullivan        | Canada          | Jane Peacock  |
| 13.86        | 33         | Ellie Sullivan        | Canada          | Jane Peacock  |
| 8.91         | 33         | Ellie Sullivan        | Canada          | Jane Peacock  |
| 1.98         | 33         | Ellie Sullivan        | Canada          | Jane Peacock  |
| 3.96         | 33         | Ellie Sullivan        | Canada          | Jane Peacock  |
| 5.94         | 33         | Ellie Sullivan        | Canada          | Jane Peacock  |
| 0.99         | 37         | Fynn Zimmermann       | Canada          | Jane Peacock  |
| 1.98         | 37         | Fynn Zimmermann       | Canada          | Jane Peacock  |
| 13.86        | 37         | Fynn Zimmermann       | Canada          | Jane Peacock  |
| 14.91        | 37         | Fynn Zimmermann       | Canada          | Jane Peacock  |
| 1.98         | 37         | Fynn Zimmermann       | Canada          | Jane Peacock  |
| 3.96         | 37         | Fynn Zimmermann       | Canada          | Jane Peacock  |
| 5.94         | 37         | Fynn Zimmermann       | Canada          | Jane Peacock  |
| 1.98         | 38         | Niklas Schröder       | Canada          | Jane Peacock  |
| 3.96         | 38         | Niklas Schröder       | Canada          | Jane Peacock  |
| 5.94         | 38         | Niklas Schröder       | Canada          | Jane Peacock  |
| 0.99         | 38         | Niklas Schröder       | Canada          | Jane Peacock  |
| 1.98         | 38         | Niklas Schröder       | Canada          | Jane Peacock  |
| 13.86        | 38         | Niklas Schröder       | Canada          | Jane Peacock  |
| 8.91         | 38         | Niklas Schröder       | Canada          | Jane Peacock  |
| 3.96         | 42         | Wyatt Girard          | Canada          | Jane Peacock  |
| 5.94         | 42         | Wyatt Girard          | Canada          | Jane Peacock  |
| 0.99         | 42         | Wyatt Girard          | Canada          | Jane Peacock  |
| 3.98         | 42         | Wyatt Girard          | Canada          | Jane Peacock  |
| 13.86        | 42         | Wyatt Girard          | Canada          | Jane Peacock  |
| 8.91         | 42         | Wyatt Girard          | Canada          | Jane Peacock  |
| 1.98         | 42         | Wyatt Girard          | Canada          | Jane Peacock  |
| 1.98         | 43         | Isabelle Mercier      | Canada          | Jane Peacock  |
| 3.96         | 43         | Isabelle Mercier      | Canada          | Jane Peacock  |
| 5.94         | 43         | Isabelle Mercier      | Canada          | Jane Peacock  |
| 0.99         | 43         | Isabelle Mercier      | Canada          | Jane Peacock  |
| 1.98         | 43         | Isabelle Mercier      | Canada          | Jane Peacock  |
| 16.86        | 43         | Isabelle Mercier      | Canada          | Jane Peacock  |
| 8.91         | 43         | Isabelle Mercier      | Canada          | Jane Peacock  |
| 8.91         | 44         | Terhi Hämäläinen      | Canada          | Jane Peacock  |
| 1.98         | 44         | Terhi Hämäläinen      | Canada          | Jane Peacock  |
| 7.96         | 44         | Terhi Hämäläinen      | Canada          | Jane Peacock  |
| 5.94         | 44         | Terhi Hämäläinen      | Canada          | Jane Peacock  |
| 0.99         | 44         | Terhi Hämäläinen      | Canada          | Jane Peacock  |
| 1.98         | 44         | Terhi Hämäläinen      | Canada          | Jane Peacock  |
| 13.86        | 44         | Terhi Hämäläinen      | Canada          | Jane Peacock  |
| 1.98         | 45         | Ladislav Kovács       | Canada          | Jane Peacock  |
| 21.86        | 45         | Ladislav Kovács       | Canada          | Jane Peacock  |
| 8.91         | 45         | Ladislav Kovács       | Canada          | Jane Peacock  |
| 1.98         | 45         | Ladislav Kovács       | Canada          | Jane Peacock  |
| 3.96         | 45         | Ladislav Kovács       | Canada          | Jane Peacock  |
| 5.94         | 45         | Ladislav Kovács       | Canada          | Jane Peacock  |
| 0.99         | 45         | Ladislav Kovács       | Canada          | Jane Peacock  |
| 5.94         | 46         | Hugh O'Reilly         | Canada          | Jane Peacock  |
| 0.99         | 46         | Hugh O'Reilly         | Canada          | Jane Peacock  |
| 1.98         | 46         | Hugh O'Reilly         | Canada          | Jane Peacock  |
| 21.86        | 46         | Hugh O'Reilly         | Canada          | Jane Peacock  |
| 8.91         | 46         | Hugh O'Reilly         | Canada          | Jane Peacock  |
| 1.98         | 46         | Hugh O'Reilly         | Canada          | Jane Peacock  |
| 3.96         | 46         | Hugh O'Reilly         | Canada          | Jane Peacock  |
| 8.91         | 52         | Emma Jones            | Canada          | Jane Peacock  |
| 1.98         | 52         | Emma Jones            | Canada          | Jane Peacock  |
| 3.96         | 52         | Emma Jones            | Canada          | Jane Peacock  |
| 5.94         | 52         | Emma Jones            | Canada          | Jane Peacock  |
| 0.99         | 52         | Emma Jones            | Canada          | Jane Peacock  |
| 1.98         | 52         | Emma Jones            | Canada          | Jane Peacock  |
| 13.86        | 52         | Emma Jones            | Canada          | Jane Peacock  |
| 1.98         | 53         | Phil Hughes           | Canada          | Jane Peacock  |
| 13.86        | 53         | Phil Hughes           | Canada          | Jane Peacock  |
| 8.91         | 53         | Phil Hughes           | Canada          | Jane Peacock  |
| 1.98         | 53         | Phil Hughes           | Canada          | Jane Peacock  |
| 3.96         | 53         | Phil Hughes           | Canada          | Jane Peacock  |
| 5.94         | 53         | Phil Hughes           | Canada          | Jane Peacock  |
| 0.99         | 53         | Phil Hughes           | Canada          | Jane Peacock  |
| 1.98         | 58         | Manoj Pareek          | Canada          | Jane Peacock  |
| 13.86        | 58         | Manoj Pareek          | Canada          | Jane Peacock  |
| 8.91         | 58         | Manoj Pareek          | Canada          | Jane Peacock  |
| 1.98         | 58         | Manoj Pareek          | Canada          | Jane Peacock  |
| 3.96         | 58         | Manoj Pareek          | Canada          | Jane Peacock  |
| 5.94         | 58         | Manoj Pareek          | Canada          | Jane Peacock  |
| 1.99         | 58         | Manoj Pareek          | Canada          | Jane Peacock  |
| 3.96         | 59         | Puja Srivastava       | Canada          | Jane Peacock  |
| 5.94         | 59         | Puja Srivastava       | Canada          | Jane Peacock  |
| 1.99         | 59         | Puja Srivastava       | Canada          | Jane Peacock  |
| 1.98         | 59         | Puja Srivastava       | Canada          | Jane Peacock  |
| 13.86        | 59         | Puja Srivastava       | Canada          | Jane Peacock  |
| 8.91         | 59         | Puja Srivastava       | Canada          | Jane Peacock  |
| 3.96         | 4          | Bjørn Hansen          | Canada          | Margaret Park |
| 5.94         | 4          | Bjørn Hansen          | Canada          | Margaret Park |
| 0.99         | 4          | Bjørn Hansen          | Canada          | Margaret Park |
| 1.98         | 4          | Bjørn Hansen          | Canada          | Margaret Park |
| 15.86        | 4          | Bjørn Hansen          | Canada          | Margaret Park |
| 8.91         | 4          | Bjørn Hansen          | Canada          | Margaret Park |
| 1.98         | 4          | Bjørn Hansen          | Canada          | Margaret Park |
| 1.98         | 5          | František Wichterlová | Canada          | Margaret Park |
| 3.96         | 5          | František Wichterlová | Canada          | Margaret Park |
| 5.94         | 5          | František Wichterlová | Canada          | Margaret Park |
| 0.99         | 5          | František Wichterlová | Canada          | Margaret Park |
| 1.98         | 5          | František Wichterlová | Canada          | Margaret Park |
| 16.86        | 5          | František Wichterlová | Canada          | Margaret Park |
| 8.91         | 5          | František Wichterlová | Canada          | Margaret Park |
| 5.94         | 8          | Daan Peeters          | Canada          | Margaret Park |
| 0.99         | 8          | Daan Peeters          | Canada          | Margaret Park |
| 1.98         | 8          | Daan Peeters          | Canada          | Margaret Park |
| 13.86        | 8          | Daan Peeters          | Canada          | Margaret Park |
| 8.91         | 8          | Daan Peeters          | Canada          | Margaret Park |
| 1.98         | 8          | Daan Peeters          | Canada          | Margaret Park |
| 3.96         | 8          | Daan Peeters          | Canada          | Margaret Park |
| 1.98         | 9          | Kara Nielsen          | Canada          | Margaret Park |
| 3.96         | 9          | Kara Nielsen          | Canada          | Margaret Park |
| 5.94         | 9          | Kara Nielsen          | Canada          | Margaret Park |
| 0.99         | 9          | Kara Nielsen          | Canada          | Margaret Park |
| 1.98         | 9          | Kara Nielsen          | Canada          | Margaret Park |
| 13.86        | 9          | Kara Nielsen          | Canada          | Margaret Park |
| 8.91         | 9          | Kara Nielsen          | Canada          | Margaret Park |
| 8.91         | 10         | Eduardo Martins       | Canada          | Margaret Park |
| 1.98         | 10         | Eduardo Martins       | Canada          | Margaret Park |
| 3.96         | 10         | Eduardo Martins       | Canada          | Margaret Park |
| 5.94         | 10         | Eduardo Martins       | Canada          | Margaret Park |
| 0.99         | 10         | Eduardo Martins       | Canada          | Margaret Park |
| 1.98         | 10         | Eduardo Martins       | Canada          | Margaret Park |
| 13.86        | 10         | Eduardo Martins       | Canada          | Margaret Park |
| 1.98         | 13         | Fernanda Ramos        | Canada          | Margaret Park |
| 3.96         | 13         | Fernanda Ramos        | Canada          | Margaret Park |
| 5.94         | 13         | Fernanda Ramos        | Canada          | Margaret Park |
| 0.99         | 13         | Fernanda Ramos        | Canada          | Margaret Park |
| 1.98         | 13         | Fernanda Ramos        | Canada          | Margaret Park |
| 13.86        | 13         | Fernanda Ramos        | Canada          | Margaret Park |
| 8.91         | 13         | Fernanda Ramos        | Canada          | Margaret Park |
| 0.99         | 16         | Frank Harris          | Canada          | Margaret Park |
| 1.98         | 16         | Frank Harris          | Canada          | Margaret Park |
| 13.86        | 16         | Frank Harris          | Canada          | Margaret Park |
| 8.91         | 16         | Frank Harris          | Canada          | Margaret Park |
| 1.98         | 16         | Frank Harris          | Canada          | Margaret Park |
| 3.96         | 16         | Frank Harris          | Canada          | Margaret Park |
| 5.94         | 16         | Frank Harris          | Canada          | Margaret Park |
| 1.98         | 20         | Dan Miller            | Canada          | Margaret Park |
| 13.86        | 20         | Dan Miller            | Canada          | Margaret Park |
| 8.91         | 20         | Dan Miller            | Canada          | Margaret Park |
| 3.98         | 20         | Dan Miller            | Canada          | Margaret Park |
| 3.96         | 20         | Dan Miller            | Canada          | Margaret Park |
| 5.94         | 20         | Dan Miller            | Canada          | Margaret Park |
| 0.99         | 20         | Dan Miller            | Canada          | Margaret Park |
| 1.98         | 22         | Heather Leacock       | Canada          | Margaret Park |
| 3.96         | 22         | Heather Leacock       | Canada          | Margaret Park |
| 5.94         | 22         | Heather Leacock       | Canada          | Margaret Park |
| 0.99         | 22         | Heather Leacock       | Canada          | Margaret Park |
| 3.98         | 22         | Heather Leacock       | Canada          | Margaret Park |
| 13.86        | 22         | Heather Leacock       | Canada          | Margaret Park |
| 8.91         | 22         | Heather Leacock       | Canada          | Margaret Park |
| 13.86        | 23         | John Gordon           | Canada          | Margaret Park |
| 8.91         | 23         | John Gordon           | Canada          | Margaret Park |
| 1.98         | 23         | John Gordon           | Canada          | Margaret Park |
| 3.96         | 23         | John Gordon           | Canada          | Margaret Park |
| 5.94         | 23         | John Gordon           | Canada          | Margaret Park |
| 0.99         | 23         | John Gordon           | Canada          | Margaret Park |
| 1.98         | 23         | John Gordon           | Canada          | Margaret Park |
| 1.98         | 26         | Richard Cunningham    | Canada          | Margaret Park |
| 3.96         | 26         | Richard Cunningham    | Canada          | Margaret Park |
| 5.94         | 26         | Richard Cunningham    | Canada          | Margaret Park |
| 0.99         | 26         | Richard Cunningham    | Canada          | Margaret Park |
| 1.98         | 26         | Richard Cunningham    | Canada          | Margaret Park |
| 23.86        | 26         | Richard Cunningham    | Canada          | Margaret Park |
| 8.91         | 26         | Richard Cunningham    | Canada          | Margaret Park |
| 8.91         | 27         | Patrick Gray          | Canada          | Margaret Park |
| 1.98         | 27         | Patrick Gray          | Canada          | Margaret Park |
| 3.96         | 27         | Patrick Gray          | Canada          | Margaret Park |
| 5.94         | 27         | Patrick Gray          | Canada          | Margaret Park |
| 0.99         | 27         | Patrick Gray          | Canada          | Margaret Park |
| 1.98         | 27         | Patrick Gray          | Canada          | Margaret Park |
| 13.86        | 27         | Patrick Gray          | Canada          | Margaret Park |
| 1.98         | 32         | Aaron Mitchell        | Canada          | Margaret Park |
| 13.86        | 32         | Aaron Mitchell        | Canada          | Margaret Park |
| 8.91         | 32         | Aaron Mitchell        | Canada          | Margaret Park |
| 1.98         | 32         | Aaron Mitchell        | Canada          | Margaret Park |
| 3.96         | 32         | Aaron Mitchell        | Canada          | Margaret Park |
| 5.94         | 32         | Aaron Mitchell        | Canada          | Margaret Park |
| 0.99         | 32         | Aaron Mitchell        | Canada          | Margaret Park |
| 1.98         | 34         | João Fernandes        | Canada          | Margaret Park |
| 3.96         | 34         | João Fernandes        | Canada          | Margaret Park |
| 5.94         | 34         | João Fernandes        | Canada          | Margaret Park |
| 0.99         | 34         | João Fernandes        | Canada          | Margaret Park |
| 1.98         | 34         | João Fernandes        | Canada          | Margaret Park |
| 13.86        | 34         | João Fernandes        | Canada          | Margaret Park |
| 10.91        | 34         | João Fernandes        | Canada          | Margaret Park |
| 1.98         | 35         | Madalena Sampaio      | Canada          | Margaret Park |
| 3.96         | 35         | Madalena Sampaio      | Canada          | Margaret Park |
| 5.94         | 35         | Madalena Sampaio      | Canada          | Margaret Park |
| 0.99         | 35         | Madalena Sampaio      | Canada          | Margaret Park |
| 1.98         | 35         | Madalena Sampaio      | Canada          | Margaret Park |
| 13.86        | 35         | Madalena Sampaio      | Canada          | Margaret Park |
| 8.91         | 35         | Madalena Sampaio      | Canada          | Margaret Park |
| 1.98         | 39         | Camille Bernard       | Canada          | Margaret Park |
| 3.96         | 39         | Camille Bernard       | Canada          | Margaret Park |
| 5.94         | 39         | Camille Bernard       | Canada          | Margaret Park |
| 1.99         | 39         | Camille Bernard       | Canada          | Margaret Park |
| 1.98         | 39         | Camille Bernard       | Canada          | Margaret Park |
| 13.86        | 39         | Camille Bernard       | Canada          | Margaret Park |
| 8.91         | 39         | Camille Bernard       | Canada          | Margaret Park |
| 1.98         | 40         | Dominique Lefebvre    | Canada          | Margaret Park |
| 13.86        | 40         | Dominique Lefebvre    | Canada          | Margaret Park |
| 8.91         | 40         | Dominique Lefebvre    | Canada          | Margaret Park |
| 2.98         | 40         | Dominique Lefebvre    | Canada          | Margaret Park |
| 3.96         | 40         | Dominique Lefebvre    | Canada          | Margaret Park |
| 5.94         | 40         | Dominique Lefebvre    | Canada          | Margaret Park |
| 0.99         | 40         | Dominique Lefebvre    | Canada          | Margaret Park |
| 1.98         | 49         | Stanisław Wójcik      | Canada          | Margaret Park |
| 13.86        | 49         | Stanisław Wójcik      | Canada          | Margaret Park |
| 8.91         | 49         | Stanisław Wójcik      | Canada          | Margaret Park |
| 1.98         | 49         | Stanisław Wójcik      | Canada          | Margaret Park |
| 3.96         | 49         | Stanisław Wójcik      | Canada          | Margaret Park |
| 5.94         | 49         | Stanisław Wójcik      | Canada          | Margaret Park |
| 0.99         | 49         | Stanisław Wójcik      | Canada          | Margaret Park |
| 1.98         | 55         | Mark Taylor           | Canada          | Margaret Park |
| 3.96         | 55         | Mark Taylor           | Canada          | Margaret Park |
| 5.94         | 55         | Mark Taylor           | Canada          | Margaret Park |
| 0.99         | 55         | Mark Taylor           | Canada          | Margaret Park |
| 1.98         | 55         | Mark Taylor           | Canada          | Margaret Park |
| 13.86        | 55         | Mark Taylor           | Canada          | Margaret Park |
| 8.91         | 55         | Mark Taylor           | Canada          | Margaret Park |
| 1.98         | 56         | Diego Gutiérrez       | Canada          | Margaret Park |
| 3.96         | 56         | Diego Gutiérrez       | Canada          | Margaret Park |
| 5.94         | 56         | Diego Gutiérrez       | Canada          | Margaret Park |
| 0.99         | 56         | Diego Gutiérrez       | Canada          | Margaret Park |
| 1.98         | 56         | Diego Gutiérrez       | Canada          | Margaret Park |
| 13.86        | 56         | Diego Gutiérrez       | Canada          | Margaret Park |
| 8.91         | 56         | Diego Gutiérrez       | Canada          | Margaret Park |
| 1.98         | 2          | Leonie Köhler         | Canada          | Steve Johnson |
| 13.86        | 2          | Leonie Köhler         | Canada          | Steve Johnson |
| 8.91         | 2          | Leonie Köhler         | Canada          | Steve Johnson |
| 1.98         | 2          | Leonie Köhler         | Canada          | Steve Johnson |
| 3.96         | 2          | Leonie Köhler         | Canada          | Steve Johnson |
| 5.94         | 2          | Leonie Köhler         | Canada          | Steve Johnson |
| 0.99         | 2          | Leonie Köhler         | Canada          | Steve Johnson |
| 8.91         | 6          | Helena Holý           | Canada          | Steve Johnson |
| 1.98         | 6          | Helena Holý           | Canada          | Steve Johnson |
| 3.96         | 6          | Helena Holý           | Canada          | Steve Johnson |
| 5.94         | 6          | Helena Holý           | Canada          | Steve Johnson |
| 0.99         | 6          | Helena Holý           | Canada          | Steve Johnson |
| 1.98         | 6          | Helena Holý           | Canada          | Steve Johnson |
| 25.86        | 6          | Helena Holý           | Canada          | Steve Johnson |
| 1.98         | 7          | Astrid Gruber         | Canada          | Steve Johnson |
| 18.86        | 7          | Astrid Gruber         | Canada          | Steve Johnson |
| 8.91         | 7          | Astrid Gruber         | Canada          | Steve Johnson |
| 1.98         | 7          | Astrid Gruber         | Canada          | Steve Johnson |
| 3.96         | 7          | Astrid Gruber         | Canada          | Steve Johnson |
| 5.94         | 7          | Astrid Gruber         | Canada          | Steve Johnson |
| 0.99         | 7          | Astrid Gruber         | Canada          | Steve Johnson |
| 1.98         | 11         | Alexandre Rocha       | Canada          | Steve Johnson |
| 13.86        | 11         | Alexandre Rocha       | Canada          | Steve Johnson |
| 8.91         | 11         | Alexandre Rocha       | Canada          | Steve Johnson |
| 1.98         | 11         | Alexandre Rocha       | Canada          | Steve Johnson |
| 3.96         | 11         | Alexandre Rocha       | Canada          | Steve Johnson |
| 5.94         | 11         | Alexandre Rocha       | Canada          | Steve Johnson |
| 0.99         | 11         | Alexandre Rocha       | Canada          | Steve Johnson |
| 8.91         | 14         | Mark Philips          | Canada          | Steve Johnson |
| 1.98         | 14         | Mark Philips          | Canada          | Steve Johnson |
| 3.96         | 14         | Mark Philips          | Canada          | Steve Johnson |
| 5.94         | 14         | Mark Philips          | Canada          | Steve Johnson |
| 0.99         | 14         | Mark Philips          | Canada          | Steve Johnson |
| 1.98         | 14         | Mark Philips          | Canada          | Steve Johnson |
| 13.86        | 14         | Mark Philips          | Canada          | Steve Johnson |
| 1.98         | 17         | Jack Smith            | Canada          | Steve Johnson |
| 3.96         | 17         | Jack Smith            | Canada          | Steve Johnson |
| 5.94         | 17         | Jack Smith            | Canada          | Steve Johnson |
| 0.99         | 17         | Jack Smith            | Canada          | Steve Johnson |
| 1.98         | 17         | Jack Smith            | Canada          | Steve Johnson |
| 13.86        | 17         | Jack Smith            | Canada          | Steve Johnson |
| 10.91        | 17         | Jack Smith            | Canada          | Steve Johnson |
| 3.96         | 21         | Kathy Chase           | Canada          | Steve Johnson |
| 5.94         | 21         | Kathy Chase           | Canada          | Steve Johnson |
| 0.99         | 21         | Kathy Chase           | Canada          | Steve Johnson |
| 1.98         | 21         | Kathy Chase           | Canada          | Steve Johnson |
| 13.86        | 21         | Kathy Chase           | Canada          | Steve Johnson |
| 8.91         | 21         | Kathy Chase           | Canada          | Steve Johnson |
| 1.98         | 21         | Kathy Chase           | Canada          | Steve Johnson |
| 5.94         | 25         | Victor Stevens        | Canada          | Steve Johnson |
| 0.99         | 25         | Victor Stevens        | Canada          | Steve Johnson |
| 1.98         | 25         | Victor Stevens        | Canada          | Steve Johnson |
| 18.86        | 25         | Victor Stevens        | Canada          | Steve Johnson |
| 8.91         | 25         | Victor Stevens        | Canada          | Steve Johnson |
| 1.98         | 25         | Victor Stevens        | Canada          | Steve Johnson |
| 3.96         | 25         | Victor Stevens        | Canada          | Steve Johnson |
| 1.98         | 28         | Julia Barnett         | Canada          | Steve Johnson |
| 13.86        | 28         | Julia Barnett         | Canada          | Steve Johnson |
| 8.91         | 28         | Julia Barnett         | Canada          | Steve Johnson |
| 1.98         | 28         | Julia Barnett         | Canada          | Steve Johnson |
| 3.96         | 28         | Julia Barnett         | Canada          | Steve Johnson |
| 11.94        | 28         | Julia Barnett         | Canada          | Steve Johnson |
| 0.99         | 28         | Julia Barnett         | Canada          | Steve Johnson |
| 8.91         | 31         | Martha Silk           | Canada          | Steve Johnson |
| 1.98         | 31         | Martha Silk           | Canada          | Steve Johnson |
| 3.96         | 31         | Martha Silk           | Canada          | Steve Johnson |
| 5.94         | 31         | Martha Silk           | Canada          | Steve Johnson |
| 0.99         | 31         | Martha Silk           | Canada          | Steve Johnson |
| 1.98         | 31         | Martha Silk           | Canada          | Steve Johnson |
| 13.86        | 31         | Martha Silk           | Canada          | Steve Johnson |
| 1.98         | 36         | Hannah Schneider      | Canada          | Steve Johnson |
| 13.86        | 36         | Hannah Schneider      | Canada          | Steve Johnson |
| 8.91         | 36         | Hannah Schneider      | Canada          | Steve Johnson |
| 1.98         | 36         | Hannah Schneider      | Canada          | Steve Johnson |
| 3.96         | 36         | Hannah Schneider      | Canada          | Steve Johnson |
| 5.94         | 36         | Hannah Schneider      | Canada          | Steve Johnson |
| 0.99         | 36         | Hannah Schneider      | Canada          | Steve Johnson |
| 1.98         | 41         | Marc Dubois           | Canada          | Steve Johnson |
| 13.86        | 41         | Marc Dubois           | Canada          | Steve Johnson |
| 8.91         | 41         | Marc Dubois           | Canada          | Steve Johnson |
| 1.98         | 41         | Marc Dubois           | Canada          | Steve Johnson |
| 3.96         | 41         | Marc Dubois           | Canada          | Steve Johnson |
| 5.94         | 41         | Marc Dubois           | Canada          | Steve Johnson |
| 0.99         | 41         | Marc Dubois           | Canada          | Steve Johnson |
| 1.98         | 47         | Lucas Mancini         | Canada          | Steve Johnson |
| 3.96         | 47         | Lucas Mancini         | Canada          | Steve Johnson |
| 5.94         | 47         | Lucas Mancini         | Canada          | Steve Johnson |
| 0.99         | 47         | Lucas Mancini         | Canada          | Steve Johnson |
| 1.98         | 47         | Lucas Mancini         | Canada          | Steve Johnson |
| 13.86        | 47         | Lucas Mancini         | Canada          | Steve Johnson |
| 8.91         | 47         | Lucas Mancini         | Canada          | Steve Johnson |
| 8.91         | 48         | Johannes Van der Berg | Canada          | Steve Johnson |
| 1.98         | 48         | Johannes Van der Berg | Canada          | Steve Johnson |
| 3.96         | 48         | Johannes Van der Berg | Canada          | Steve Johnson |
| 8.94         | 48         | Johannes Van der Berg | Canada          | Steve Johnson |
| 0.99         | 48         | Johannes Van der Berg | Canada          | Steve Johnson |
| 1.98         | 48         | Johannes Van der Berg | Canada          | Steve Johnson |
| 13.86        | 48         | Johannes Van der Berg | Canada          | Steve Johnson |
| 0.99         | 50         | Enrique Muñoz         | Canada          | Steve Johnson |
| 1.98         | 50         | Enrique Muñoz         | Canada          | Steve Johnson |
| 13.86        | 50         | Enrique Muñoz         | Canada          | Steve Johnson |
| 8.91         | 50         | Enrique Muñoz         | Canada          | Steve Johnson |
| 1.98         | 50         | Enrique Muñoz         | Canada          | Steve Johnson |
| 3.96         | 50         | Enrique Muñoz         | Canada          | Steve Johnson |
| 5.94         | 50         | Enrique Muñoz         | Canada          | Steve Johnson |
| 1.98         | 51         | Joakim Johansson      | Canada          | Steve Johnson |
| 3.96         | 51         | Joakim Johansson      | Canada          | Steve Johnson |
| 6.94         | 51         | Joakim Johansson      | Canada          | Steve Johnson |
| 0.99         | 51         | Joakim Johansson      | Canada          | Steve Johnson |
| 1.98         | 51         | Joakim Johansson      | Canada          | Steve Johnson |
| 13.86        | 51         | Joakim Johansson      | Canada          | Steve Johnson |
| 8.91         | 51         | Joakim Johansson      | Canada          | Steve Johnson |
| 0.99         | 54         | Steve Murray          | Canada          | Steve Johnson |
| 1.98         | 54         | Steve Murray          | Canada          | Steve Johnson |
| 13.86        | 54         | Steve Murray          | Canada          | Steve Johnson |
| 8.91         | 54         | Steve Murray          | Canada          | Steve Johnson |
| 1.98         | 54         | Steve Murray          | Canada          | Steve Johnson |
| 3.96         | 54         | Steve Murray          | Canada          | Steve Johnson |
| 5.94         | 54         | Steve Murray          | Canada          | Steve Johnson |
| 1.98         | 57         | Luis Rojas            | Canada          | Steve Johnson |
| 13.86        | 57         | Luis Rojas            | Canada          | Steve Johnson |
| 17.91        | 57         | Luis Rojas            | Canada          | Steve Johnson |
| 1.98         | 57         | Luis Rojas            | Canada          | Steve Johnson |
| 3.96         | 57         | Luis Rojas            | Canada          | Steve Johnson |
| 5.94         | 57         | Luis Rojas            | Canada          | Steve Johnson |
| 0.99         | 57         | Luis Rojas            | Canada          | Steve Johnson |

#### 8. ¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?
```sql
select count(InvoiceId) as TotalInvoices, substr(InvoiceDate, 1, 4) as Year, sum(total) as TotalSales from Invoices group by Year;
```
| TotalInvoices | Year | TotalSales |
|---------------|------|------------|
| 83            | 2009 | 449.46     |
| 83            | 2010 | 481.45     |
| 83            | 2011 | 469.58     |
| 83            | 2012 | 477.53     |
| 80            | 2013 | 450.58     |

#### 9. Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.
```sql
select InvoiceId, count(InvoiceLineId) as Items from Invoice_items where InvoiceId = 37;
```
| InvoiceId | Items |
|-----------|-------|
| 37        | 4     |


#### 10. Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
```sql
select InvoiceId, count(InvoiceLineId) as Items from Invoice_items group by InvoiceId;
```
| InvoiceId | Items |
|-----------|-------|
| 1         | 2     |
| 2         | 4     |
| 3         | 6     |
| 4         | 9     |
| 5         | 14    |
| 6         | 1     |
| 7         | 2     |
| 8         | 2     |
| 9         | 4     |
| 10        | 6     |
| 11        | 9     |
| 12        | 14    |
| 13        | 1     |
| 14        | 2     |
| 15        | 2     |
| 16        | 4     |
| 17        | 6     |
| 18        | 9     |
| 19        | 14    |
| 20        | 1     |
| 21        | 2     |
| 22        | 2     |
| 23        | 4     |
| 24        | 6     |
| 25        | 9     |
| 26        | 14    |
| 27        | 1     |
| 28        | 2     |
| 29        | 2     |
| 30        | 4     |
| 31        | 6     |
| 32        | 9     |
| 33        | 14    |
| 34        | 1     |
| 35        | 2     |
| 36        | 2     |
| 37        | 4     |
| 38        | 6     |
| 39        | 9     |
| 40        | 14    |
| 41        | 1     |
| 42        | 2     |
| 43        | 2     |
| 44        | 4     |
| 45        | 6     |
| 46        | 9     |
| 47        | 14    |
| 48        | 1     |
| 49        | 2     |
| 50        | 2     |
| 51        | 4     |
| 52        | 6     |
| 53        | 9     |
| 54        | 14    |
| 55        | 1     |
| 56        | 2     |
| 57        | 2     |
| 58        | 4     |
| 59        | 6     |
| 60        | 9     |
| 61        | 14    |
| 62        | 1     |
| 63        | 2     |
| 64        | 2     |
| 65        | 4     |
| 66        | 6     |
| 67        | 9     |
| 68        | 14    |
| 69        | 1     |
| 70        | 2     |
| 71        | 2     |
| 72        | 4     |
| 73        | 6     |
| 74        | 9     |
| 75        | 14    |
| 76        | 1     |
| 77        | 2     |
| 78        | 2     |
| 79        | 4     |
| 80        | 6     |
| 81        | 9     |
| 82        | 14    |
| 83        | 1     |
| 84        | 2     |
| 85        | 2     |
| 86        | 4     |
| 87        | 6     |
| 88        | 9     |
| 89        | 14    |
| 90        | 1     |
| 91        | 2     |
| 92        | 2     |
| 93        | 4     |
| 94        | 6     |
| 95        | 9     |
| 96        | 14    |
| 97        | 1     |
| 98        | 2     |
| 99        | 2     |
| 100       | 4     |
| 101       | 6     |
| 102       | 9     |
| 103       | 14    |
| 104       | 1     |
| 105       | 2     |
| 106       | 2     |
| 107       | 4     |
| 108       | 6     |
| 109       | 9     |
| 110       | 14    |
| 111       | 1     |
| 112       | 2     |
| 113       | 2     |
| 114       | 4     |
| 115       | 6     |
| 116       | 9     |
| 117       | 14    |
| 118       | 1     |
| 119       | 2     |
| 120       | 2     |
| 121       | 4     |
| 122       | 6     |
| 123       | 9     |
| 124       | 14    |
| 125       | 1     |
| 126       | 2     |
| 127       | 2     |
| 128       | 4     |
| 129       | 6     |
| 130       | 9     |
| 131       | 14    |
| 132       | 1     |
| 133       | 2     |
| 134       | 2     |
| 135       | 4     |
| 136       | 6     |
| 137       | 9     |
| 138       | 14    |
| 139       | 1     |
| 140       | 2     |
| 141       | 2     |
| 142       | 4     |
| 143       | 6     |
| 144       | 9     |
| 145       | 14    |
| 146       | 1     |
| 147       | 2     |
| 148       | 2     |
| 149       | 4     |
| 150       | 6     |
| 151       | 9     |
| 152       | 14    |
| 153       | 1     |
| 154       | 2     |
| 155       | 2     |
| 156       | 4     |
| 157       | 6     |
| 158       | 9     |
| 159       | 14    |
| 160       | 1     |
| 161       | 2     |
| 162       | 2     |
| 163       | 4     |
| 164       | 6     |
| 165       | 9     |
| 166       | 14    |
| 167       | 1     |
| 168       | 2     |
| 169       | 2     |
| 170       | 4     |
| 171       | 6     |
| 172       | 9     |
| 173       | 14    |
| 174       | 1     |
| 175       | 2     |
| 176       | 2     |
| 177       | 4     |
| 178       | 6     |
| 179       | 9     |
| 180       | 14    |
| 181       | 1     |
| 182       | 2     |
| 183       | 2     |
| 184       | 4     |
| 185       | 6     |
| 186       | 9     |
| 187       | 14    |
| 188       | 1     |
| 189       | 2     |
| 190       | 2     |
| 191       | 4     |
| 192       | 6     |
| 193       | 9     |
| 194       | 14    |
| 195       | 1     |
| 196       | 2     |
| 197       | 2     |
| 198       | 4     |
| 199       | 6     |
| 200       | 9     |
| 201       | 14    |
| 202       | 1     |
| 203       | 2     |
| 204       | 2     |
| 205       | 4     |
| 206       | 6     |
| 207       | 9     |
| 208       | 14    |
| 209       | 1     |
| 210       | 2     |
| 211       | 2     |
| 212       | 4     |
| 213       | 6     |
| 214       | 9     |
| 215       | 14    |
| 216       | 1     |
| 217       | 2     |
| 218       | 2     |
| 219       | 4     |
| 220       | 6     |
| 221       | 9     |
| 222       | 14    |
| 223       | 1     |
| 224       | 2     |
| 225       | 2     |
| 226       | 4     |
| 227       | 6     |
| 228       | 9     |
| 229       | 14    |
| 230       | 1     |
| 231       | 2     |
| 232       | 2     |
| 233       | 4     |
| 234       | 6     |
| 235       | 9     |
| 236       | 14    |
| 237       | 1     |
| 238       | 2     |
| 239       | 2     |
| 240       | 4     |
| 241       | 6     |
| 242       | 9     |
| 243       | 14    |
| 244       | 1     |
| 245       | 2     |
| 246       | 2     |
| 247       | 4     |
| 248       | 6     |
| 249       | 9     |
| 250       | 14    |
| 251       | 1     |
| 252       | 2     |
| 253       | 2     |
| 254       | 4     |
| 255       | 6     |
| 256       | 9     |
| 257       | 14    |
| 258       | 1     |
| 259       | 2     |
| 260       | 2     |
| 261       | 4     |
| 262       | 6     |
| 263       | 9     |
| 264       | 14    |
| 265       | 1     |
| 266       | 2     |
| 267       | 2     |
| 268       | 4     |
| 269       | 6     |
| 270       | 9     |
| 271       | 14    |
| 272       | 1     |
| 273       | 2     |
| 274       | 2     |
| 275       | 4     |
| 276       | 6     |
| 277       | 9     |
| 278       | 14    |
| 279       | 1     |
| 280       | 2     |
| 281       | 2     |
| 282       | 4     |
| 283       | 6     |
| 284       | 9     |
| 285       | 14    |
| 286       | 1     |
| 287       | 2     |
| 288       | 2     |
| 289       | 4     |
| 290       | 6     |
| 291       | 9     |
| 292       | 14    |
| 293       | 1     |
| 294       | 2     |
| 295       | 2     |
| 296       | 4     |
| 297       | 6     |
| 298       | 9     |
| 299       | 14    |
| 300       | 1     |
| 301       | 2     |
| 302       | 2     |
| 303       | 4     |
| 304       | 6     |
| 305       | 9     |
| 306       | 14    |
| 307       | 1     |
| 308       | 2     |
| 309       | 2     |
| 310       | 4     |
| 311       | 6     |
| 312       | 9     |
| 313       | 14    |
| 314       | 1     |
| 315       | 2     |
| 316       | 2     |
| 317       | 4     |
| 318       | 6     |
| 319       | 9     |
| 320       | 14    |
| 321       | 1     |
| 322       | 2     |
| 323       | 2     |
| 324       | 4     |
| 325       | 6     |
| 326       | 9     |
| 327       | 14    |
| 328       | 1     |
| 329       | 2     |
| 330       | 2     |
| 331       | 4     |
| 332       | 6     |
| 333       | 9     |
| 334       | 14    |
| 335       | 1     |
| 336       | 2     |
| 337       | 2     |
| 338       | 4     |
| 339       | 6     |
| 340       | 9     |
| 341       | 14    |
| 342       | 1     |
| 343       | 2     |
| 344       | 2     |
| 345       | 4     |
| 346       | 6     |
| 347       | 9     |
| 348       | 14    |
| 349       | 1     |
| 350       | 2     |
| 351       | 2     |
| 352       | 4     |
| 353       | 6     |
| 354       | 9     |
| 355       | 14    |
| 356       | 1     |
| 357       | 2     |
| 358       | 2     |
| 359       | 4     |
| 360       | 6     |
| 361       | 9     |
| 362       | 14    |
| 363       | 1     |
| 364       | 2     |
| 365       | 2     |
| 366       | 4     |
| 367       | 6     |
| 368       | 9     |
| 369       | 14    |
| 370       | 1     |
| 371       | 2     |
| 372       | 2     |
| 373       | 4     |
| 374       | 6     |
| 375       | 9     |
| 376       | 14    |
| 377       | 1     |
| 378       | 2     |
| 379       | 2     |
| 380       | 4     |
| 381       | 6     |
| 382       | 9     |
| 383       | 14    |
| 384       | 1     |
| 385       | 2     |
| 386       | 2     |
| 387       | 4     |
| 388       | 6     |
| 389       | 9     |
| 390       | 14    |
| 391       | 1     |
| 392       | 2     |
| 393       | 2     |
| 394       | 4     |
| 395       | 6     |
| 396       | 9     |
| 397       | 14    |
| 398       | 1     |
| 399       | 2     |
| 400       | 2     |
| 401       | 4     |
| 402       | 6     |
| 403       | 9     |
| 404       | 14    |
| 405       | 1     |
| 406       | 2     |
| 407       | 2     |
| 408       | 4     |
| 409       | 6     |
| 410       | 9     |
| 411       | 14    |
| 412       | 1     |

#### 11. Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.

#### 12. Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.

#### 13. Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.

#### 14. Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

#### 15. Proporciona una consulta que muestre todas las facturas.

#### 16. Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.

#### 17. ¿Qué agente de ventas realizó más ventas en 2009?

#### 18. Escribir una consulta que muestre todas las playlists de la base de datos.

#### 19. Escribe una consulta que liste todas las canciones de una playlist.

#### 20. Escribe una consulta que liste **exclusivamente** el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.