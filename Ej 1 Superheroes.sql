select * from creador;
select * from personajes;
/*
a) Insertar en las tablas creadas los siguientes datos: 
*/
insert into creador (id_creador, nombre) values (1, 'Marvel');
insert into creador (id_creador, nombre) values (2, 'DC Comics');

insert into personajes 
values (1, 'Bruce Banner', 'Hulk', 160, '600 mil', 75, 98, 1962, 'Físico Nuclear', 1);
insert into personajes 
values (2, 'Tony Stark', 'Iron Man', 170, '200 mil', 70, 123, 1963, 'Inventor Industrial', 1);
insert into personajes 
values (3, 'Thor Odinson', 'Thor', 145, 'infinita', 100, 235, 1962, 'Rey de Asgard', 1);
insert into personajes 
values (4, 'Wanda Maximoff', 'Bruja Escarlata', 170, '100 mil', 90, 345, 1964, 'Bruja', 1);
insert into personajes 
values (5, 'Carol Danvers', 'Capitana Marvel', 157, '250 mil', 85, 128, 1968, 'Oficial de inteligencia', 1);
insert into personajes 
values (6, 'Thanos', 'Thanos', 170, 'infinita', 40, 306, 1973, 'Adorador de la muerte', 1);
insert into personajes 
values (7, 'Peter Parker', 'Spiderman', 165, '25 mil', 80, 74, 1962, 'Fotógrafo', 1);
insert into personajes 
values (8, 'Steve Rogers', 'Capitan America', 145, '600', 45, 60, 1941, 'Oficial Federal', 1);
insert into personajes 
values (9, 'Bobby Drake', 'Ice Man', 140, '2 mil', 64, 122, 1963, 'Contador', 1);
insert into personajes 
values (10, 'Barry', 'Flash', 160, '10mil', 120, 168, 1956, 'Científico forense', 2);
insert into personajes 
values (11, 'Bruce Wayne', 'Batman', 170, '500', 32, 47, 1939, 'Hombre de negocios', 2);
insert into personajes 
values (12, 'Clarck Kent', 'Superman', 165, 'infinita', 120, 182, 1948, 'Reportero', 2);
insert into personajes 
values (13, 'Diana Prince', 'Mujer Maravilla', 160, 'infinita', 95, 127, 1949, 'Princesa Guerrera', 2);

/*
b) Cambiar en la tabla personajes el año de aparición a 1938 del personaje Superman. A continuación,
realizar un listado de toda la tabla para verificar que el personaje haya sido actualizado. 
==> Edit>Preferences>destildar Safe Update   y reconnect to DBMS
*/
update personajes set aparicion = 1938 where personaje = 'Superman';
select * from personajes;

/*
c) Eliminar el registro que contiene al personaje Flash. A continuación, mostrar toda la tabla para verificar que
el registro haya sido eliminado. 
*/
delete from personajes where personaje = 'Flash';
select * from personajes;

/*
d) Eliminar la base de datos superhéroes
 */
 drop schema superheroes;