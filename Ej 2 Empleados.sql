/*
1. Obtener los datos completos de los empleados. 
*/
select * from empleados;

/*
2. Obtener los datos completos de los departamentos. 
*/
select * from departamentos;

/*
3. Listar el nombre de los departamentos.
*/
select distinct nombre_depto from departamentos;

/*
4. Obtener el nombre y salario de todos los empleados.
*/
select nombre, sal_emp from empleados;

/*
5. Listar todas las comisiones.
*/
select comision_emp from empleados;

/*
6. Obtener los datos de los empleados cuyo cargo sea ‘Secretaria’.
*/
select * 
from empleados
where cargo_emp = 'Secretaria';

/*
7. Obtener los datos de los empleados vendedores, ordenados por nombre alfabéticamente.
*/
select * 
from empleados
where cargo_emp = 'Vendedor'
order by nombre;

/*
8. Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a mayor.
*/
select nombre, cargo_emp
from empleados
order by sal_emp;

/*
9. Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para las respectivas
tablas de empleados.
*/
select nombre as 'Nombre', cargo_emp as 'Cargo'
from empleados
order by sal_emp;

/*
10. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por
comisión de menor a mayor.
*/
select sal_emp, comision_emp
from empleados
where id_depto = 2000
order by comision_emp;

/*
11. Obtener el valor total a pagar que resulta de sumar el salario y la comisión de los empleados
del departamento 3000 una bonificación de 500, en orden alfabético del empleado.
*/
select nombre, sal_emp + comision_emp + 500 as 'valor total'
from empleados
where id_depto = 3000
order by nombre;

/*
12. Muestra los empleados cuyo nombre empiece con la letra J.
*/
select *
from empleados
where nombre like 'J%';

/*
13. Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos
empleados que tienen comisión superior a 1000.
*/
select nombre as 'Nombre', sal_emp as 'Salario', comision_emp as 'Comisión', sal_emp + comision_emp as 'Salario Total'
from empleados
where comision_emp > 1000;

/*
14. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión.
*/
select nombre as 'Nombre', sal_emp as 'Salario', comision_emp as 'Comisión', sal_emp + comision_emp as 'Salario Total'
from empleados
where comision_emp = 0;

/*
15. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
*/
select *
from empleados
where comision_emp > sal_emp;

/*
16. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
*/
select *
from empleados
where comision_emp <= 0.3 * sal_emp;

/*
17. Hallar los empleados cuyo nombre no contiene la cadena “MA”
*/
select *
from empleados
where nombre not like'%Ma%';

/*
18. Obtener los nombres de los departamentos que sean “Ventas” ni “Investigación” ni
‘Mantenimiento. 
¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?
*/
select distinct nombre_depto
from departamentos
where nombre_depto in ('Ventas', 'Investigacion', 'Mantenimiento');

/*
19. Ahora obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” ni
‘Mantenimiento.
*/
select distinct nombre_depto
from departamentos
where nombre_depto not in ('Ventas', 'Investigacion', 'Mantenimiento');

/*
20. Mostrar el salario más alto de la empresa.
*/
select max(sal_emp) as 'Mayor salario'
from empleados;

/*
21. Mostrar el nombre del último empleado de la lista por orden alfabético.
*/
select max(nombre) as 'último empleado'
from empleados;

/*
22. Hallar el salario más alto, el más bajo y la diferencia entre ellos.
*/
select max(sal_emp) as 'Mayor salario', min(sal_emp) as 'Menor salario', max(sal_emp)-min(sal_emp) as 'Diferencia'
from empleados;
/*
23. Hallar el salario promedio por departamento.
*/
select id_depto, avg(sal_emp) as 'Salario promedio'
from empleados
group by id_depto;

/*
***************Consultas con Having***************************************************
24. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados
de esos departamentos.
*/
select id_depto, count(*)
from empleados
group by id_depto
having count(*) > 3;

/*
25. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los
que tengan más de dos empleados (2 incluido).
¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?¿?
*/
select cod_jefe, nombre
from empleados
where cargo_emp in ('Director','Gerente') or cargo_emp like 'Jefe%'; 

/*
26. Hallar los departamentos que no tienen empleados
*/
select id_depto, count(*) as 'Cantidad empleados'
from empleados
group by id_depto
having count(*)=0;

/*
********************************Consulta con Subconsulta****************************************
27. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa.
Ordenarlo por departamento. 
*/
select *
from empleados
where sal_emp >= (select avg(sal_emp) from empleados)
order by id_depto;