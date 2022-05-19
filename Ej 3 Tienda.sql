-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre, precio from producto;

-- 3. Lista todas las columnas de la tabla producto. 
select * from producto;

-- 4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio) from producto;

-- 5. Lista el código de los fabricantes que tienen productos en la tabla producto.
select codigo_fabricante 
from producto;

-- 10. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar los repetidos.
select distinct codigo_fabricante 
from producto;

-- 11. Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre
from fabricante
order by nombre;

-- 12. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente
-- y en segundo lugar por el precio de forma descendente. 
-- ¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?
select nombre, precio
from producto
order by nombre asc, precio desc; 

-- 13. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select *
from fabricante limit 5;


-- 14. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio
from producto
order by precio asc limit 1;

-- 15. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio
from producto
order by precio desc limit 1;

-- 16. Lista el nombre de los productos que tienen un precio menor o igual a $120.
select nombre, precio
from producto
where precio <= 120;

-- 17. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador BETWEEN.
select nombre, precio
from producto
where precio between 60 and 120;

-- 18. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select nombre, codigo_fabricante
from producto
where codigo_fabricante in (1, 3, 5);

-- 23. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre
from producto
where nombre like 'Portatil%';

/* ********************************Consultas Multitabla********************************************
1. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre
del fabricante, de todos los productos de la base de datos.
*/
select p.codigo, p.nombre, f.codigo, f.nombre
from producto p, fabricante f
where f.codigo = p.codigo_fabricante;

/*2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
*/
select p.nombre, p.precio, f.nombre
from producto p, fabricante f
where f.codigo = p.codigo_fabricante
order by f.nombre;

-- 3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select p.nombre, min(p.precio), f.nombre
from producto p, fabricante f
where f.codigo = p.codigo_fabricante;

-- 4. Devuelve una lista de todos los productos del fabricante Lenovo.
select p.codigo, p.nombre, f.nombre
from producto p, fabricante f
where f.codigo = p.codigo_fabricante and f.nombre like 'Lenovo';

-- 5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que $200.
select p.nombre, f.nombre, p.precio
from producto p, fabricante f
where f.codigo = p.codigo_fabricante
and f.nombre like 'Crucial' and p.precio > 200;

-- 6. Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackard. Utilizando el operador IN.
select p.nombre, f.nombre
from producto p, fabricante f
where f.codigo = p.codigo_fabricante
and f.nombre in ('Asus', 'Hewlett-Packard');

/*7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
productos que tengan un precio mayor o igual a $180. Ordene el resultado en primer lugar por el
precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)*/
select p.nombre,  p.precio, f.nombre
from producto p, fabricante f
where f.codigo = p.codigo_fabricante
and p.precio >= 180
order by p.precio desc, p.nombre asc;

/************************Consultas Multitabla********************************
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
*********************************************************************************
1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que
no tienen productos asociados. */
select f.nombre, p.nombre
from producto p right join fabricante f
on f.codigo = p.codigo_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
-- ¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?
select *
from fabricante f 
where not exists (select p.codigo_fabricante
                  from producto p
                  where f.codigo = p.codigo_fabricante);

/*******************Subconsultas (En la cláusula WHERE)*********************************************
Con operadores básicos de comparación
***************************************************************************************/
-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select p.nombre
from producto p 
where p.codigo_fabricante = (select f.codigo 
							from fabricante f 
                            where nombre like 'Lenovo');

/*2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro
del fabricante Lenovo. (Sin utilizar INNER JOIN).
¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?*/
select *
from producto p
where p.precio = (select max(p.precio)
				  from producto p
                  where p.codigo_fabricante = (select f.codigo 
							                   from fabricante f 
											   where nombre like 'Lenovo'));

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
select p.nombre
from producto p
where p.precio = (select max(p.precio)
				  from producto p
                  where p.codigo_fabricante = (select f.codigo 
							                   from fabricante f 
											   where nombre like 'Lenovo'));

-- 4. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
select p.nombre, p.precio, p.codigo_fabricante
from producto p
where p.codigo_fabricante = 1 and p.precio > (select AVG(p.precio)
				                              from producto p
                                              where p.codigo_fabricante = 1);

/**********************Subconsultas con IN y NOT IN*************************************/
-- 1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).


-- 2. Devuelve los nombres de los fabricantes que no tienen productos asociados.(Utilizando IN o NOT IN).

/**************************************Subconsultas (En la cláusula HAVING)******************/
/*1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de
productos que el fabricante Lenovo.*/