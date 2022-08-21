select * from users;
select * from empresas;
select * from atributos;
select * from componentes;
select * from menu_roles;
select * from menus;
select * from opcion_cas;
select * from opciones;
select * from personas;
select * from roles;
select * from sessions;
select * from persona_empresa_formularios;
select * from parametros p ;

select *
from usuario_proceso_permisos UPP
inner join usuario_procesos UP on(UPP.usuario_proceso_id=UP.id)
inner join procesos P on(UP.proceso_id);


select * from schema_migrations;
delete from schema_migrations;

drop table if exists ar_internal_metadata cascade;
drop table if exists atributos cascade;
drop table if exists areas cascade;

drop table if exists articulos cascade;
drop table if exists bitacora_autenticacion_movils cascade;

drop table if exists bitacora_consulta_movils cascade;
drop table if exists bitacora_detalle_ots cascade;
drop table if exists bitacora_ots cascade;
drop table if exists bitacora_token_personas cascade;

drop table if exists caracteristica_equipos cascade;
drop table if exists caracteristicas cascade;
drop table if exists combos cascade;
drop table if exists componentes cascade;
drop table if exists correlativo_envios cascade;
drop table if exists datos_apis cascade;
drop table if exists datos_externos cascade;

drop table if exists correlativos cascade;
drop table if exists detalle_combos cascade;
drop table if exists detalle_datos_apis cascade;
drop table if exists detalle_datos_externos cascade;
drop table if exists detalle_equipos cascade;
drop table if exists detalle_orden_trabajos cascade;
drop table if exists detalle_tipo_datos cascade;
drop table if exists empresas cascade;

drop table if exists equipos cascade;
drop table if exists estado_orden_trabajos cascade;
drop table if exists labor_articulos cascade;
drop table if exists labors cascade;
drop table if exists mantenimiento_labors cascade;
drop table if exists mantenimientos cascade;
drop table if exists menu_roles cascade;
drop table if exists menus cascade;
drop table if exists opcion_cas cascade;
drop table if exists opciones cascade;
drop table if exists orden_compras cascade;
drop table if exists orden_trabajos cascade;

drop table if exists parametros cascade;
drop table if exists persona_empresa_formularios cascade;
drop table if exists personas cascade;
drop table if exists personas_areas cascade;
drop table if exists proveedores cascade;
drop table if exists roles cascade;
drop table if exists schema_migrations cascade;

drop table if exists sessions cascade;
drop table if exists tipo_combos cascade;
drop table if exists tipo_datos cascade;
drop table if exists tipo_equipos cascade;
drop table if exists tipo_mantenimientos cascade;
drop table if exists tipo_transaccions cascade;
drop table if exists users cascade;

drop table if exists tipo_usuarios cascade;
drop table if exists macro_procesos cascade;
drop table if exists tipo_procesos cascade;
drop table if exists procesos cascade;
drop table if exists usuario_procesos cascade;
drop table if exists usuario_proceso_permisos cascade;
















