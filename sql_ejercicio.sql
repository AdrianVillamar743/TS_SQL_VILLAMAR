
create database ejemplo_sql

use ejemplo_sql
create table estudiantes (
id     int identity (1,1),
nombre varchar (50),
estado bit 
)

:
insert into estudiantes (nombre,estado) values ('Adrian',0)


select *from estudiantes

create table examen (
id_ex   int identity (1,1),
nota_ex decimal (5,2),
id      int
)


ALTER TABLE estudiantes ADD CONSTRAINT pk_estudiantes_id PRIMARY KEY (id)
ALTER TABLE examen ADD CONSTRAINT pk_examen_id PRIMARY KEY (id_ex)

ALTER TABLE examen ADD FOREIGN KEY (id) REFERENCES estudiantes(id);

insert into examen (nota_ex,id) values (98.2,1)




create view vw_consulta_notas
as
select e.id_ex,e.nota_ex, est.nombre from examen e, estudiantes est where e.id=est.id 


select *from vw_consulta_notas



create function f_cantidad_personas_calificacion
(
@calificacion    float
)
returns int
as 
begin
declare @cantidad int

select @cantidad = count(*) from examen e,estudiantes est where e.id=est.id group by e.nota_ex

return @cantidad
end


select dbo.f_cantidad_personas_calificacion(98.2)


