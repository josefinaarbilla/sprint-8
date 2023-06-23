-- Tabla Usuario
create table usuario(
    id serial primary key,
    email varchar unique,
    activo boolean
);

-- Tabla Prioridad
create table prioridad(
    id serial primary key,
    nombre varchar,
    descripcion varchar
);

-- Tabla Tarea
create table tarea(
    id serial primary key,
    titulo varchar,
    prioridad_id int references prioridad(id),
    usuario_id int references usuario(id), 
    completado boolean
);


-- Crear categorias de prioridad

insert into 
	prioridad (nombre, descripcion)
values 
	('Alta', 'La tarea es urgente');

insert into 
	prioridad (nombre, descripcion)
values 
	('Media', 'La tarea puede ser aplazada');

insert into 
	prioridad (nombre, descripcion)
values 
	('Baja', 'La tarea no es urgente');
	

-- Crear usuarios

insert into
	usuario (email, activo)
values 
	('juan@gmail.com', false),
	('maria@gmail.com', true),
	('jose@gmail.com', true);


-- Crear tareas

insert into
	tarea (titulo, prioridad_id, usuario_id, completado)
VALUES 
	('Tarea 1', 1, 1, false),
    ('Tarea 2', 2, 1, true),
    ('Tarea 3', 1, 2, false),
    ('Tarea 4', 3, 2, true),
    ('Tarea 5', 2, 3, true);


-- Obtener todas las tareas

select 
	* 
from 
	tarea;


-- Obtener todas las tareas por usuario

select 
	* 
from 
	tarea 
where
	usuario_id = 1;


-- Obtener todas las tareas que sean de un usuario y esten pendientes

select 
	* 
from 
	tarea 
where
	usuario_id = 1 and completado = false;


-- Borrar una tarea
 
delete from
 	tarea 
where 
	id = 1;
	
	
-- Insertar un mail repetido

insert into
	usuario (email, activo)
values 
	('juan@gmail.com', true); -- ERROR: el email es unique, es decir no puede repetirse


-- Eliminar una prioridad que está siendo referenciada en una tarea
-- Esto no es posible ya que funciona como una clave foranea. Si se quiere hacer, debera ser con una cascade.

