/*#####################################################################################################################################################################################################*/	
/*******************************************************************************************************************************************************************************************************/
--	Creacion devise de user, enlace: https://makeitrealcamp.gitbook.io/ruby-on-rails-5/8-devise
	-- Instalacion de devise
	rails generate devise:install
	
	-- Dependiendo de la configuración de su aplicación, es posible que se requiera alguna configuración manual:

	  1. Asegúrese de haber definido las opciones de URL predeterminadas en los archivos de su entorno. Aquí
		 es un ejemplo de default_url_options apropiado para un entorno de desarrollo
		 en config/environments/development.rb:

		   config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

		 En producción, :host debe establecerse en el host real de su aplicación.

		 * Requerido para todas las aplicaciones. *

	  2. Asegúrese de haber definido root_url a *algo* en su config/routes.rb
		 Por ejemplo:

		   root to: "home#index"
		 
		 * No se requiere para aplicaciones solo de API *

	  3. Asegúrese de tener mensajes flash en app/views/layouts/application.html.erb
		 Por ejemplo:

			<p class="notice"><%= notice %></p>
			<p class="alert"><%= alert %></p>

		 * No se requiere para aplicaciones solo de API *

	  4. Puede copiar las vistas de Devise (para personalizarlas) en su aplicación ejecutando:

		   rails g devise:views
		   
		 * No requerido *
	
	-- Generación devise user
	rails generate devise user user_created_id:integer user_updated_id:integer estado:string{10}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:personas
	has_many		:parametros
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de atributo
	rails generate scaffold atributo nombre:string{200} descripcion:text user_created_id:integer user_updated_id:integer estado:string{10}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:opcion_cas
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de componente
	rails generate scaffold componente nombre:string{200} descripcion:text user_created_id:integer user_updated_id:integer estado:string{10}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:opcion_cas
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de menu
	rails generate scaffold menu nombre:string{200} icono:text descripcion:text user_created_id:integer user_updated_id:integer estado:string{10}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:opciones
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de opcion, con referencia al modelo(tabla) menu
	rails generate scaffold opcion nombre:string{200} icono:text path:text descripcion:text controlador:string{300} user_created_id:integer user_updated_id:integer estado:string{10} menu:references
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:menu_roles
	has_many		:opcion_cas
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de opcion_ca, con referencia al modelo(tabla) componente, atributo y opcion
	rails generate scaffold opcion_ca descripcion:text user_created_id:integer user_updated_id:integer estado:string{10} componente:references atributo:references opcion:references
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:persona_empresa_formularios
		
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de rol
	rails generate scaffold rol nombre:string{200} descripcion:text user_created_id:integer user_updated_id:integer estado:string{10}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:menu_roles
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de menu_rol, con referencia al modelo(tabla) rol y opcion
	rails generate scaffold menu_rol menu_padre:integer user_created_id:integer user_updated_id:integer estado:string{10} rol:references opcion:references
			
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de empresa
	rails generate scaffold empresa nombre:string{200} descripcion:text codigo_empresa:integer user_created_id:integer user_updated_id:integer estado:string{10}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:areas
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de area, con referencia al modelo (tabla) empresa
	rails generate scaffold area nombre:string{200} descripcion:text user_created_id:integer user_updated_id:integer estado:string{10} empresa:references
	has_many		:personas_areas
	
/*******************************************************************************************************************************************************************************************************/
--	Usa para manejo de fotografias, Enlace: https://github.com/carrierwaveuploader/carrierwave/
--	Cargue archivos en sus aplicaciones de Ruby, asígnelos a una variedad de ORM, guárdelos en diferentes backends
	gem 'carrierwave'
	
/*******************************************************************************************************************************************************************************************************/
--	Creación model de persona, con referencia al modelo(tabla) User
	rails generate model persona nombre:string{100} apellido:string{100} foto:string telefono:integer direccion:text token:string{1000} user_created_id:integer user_updated_id:integer estado:string{10} user:references
	has_many		:personas_areas
	
--	Creación controlador de persona y sus metodos show y edit, primero crear el MVC empresa
	rails generate controller Personas show edit
	
/*******************************************************************************************************************************************************************************************************/
--	Creacion scaffold de persona_area, con referencia al modelo (tabla) area y persona
	rails generate scaffold personas_area user_created_id:integer user_updated_id:integer estado:string{10} area:references persona:references
	has_many		:persona_empresa_formularios

/*******************************************************************************************************************************************************************************************************/
--	Creacion scaffold de persona_empresa_formulario
	rails generate scaffold persona_empresa_formulario descripcion:text user_created_id:integer user_updated_id:integer estado:string{10} opcion_ca:references personas_area:references

/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de parametro, con referencia al modelo (tabla) user
	rails generate scaffold parametro view_default:string{255} ruta_predeterminada:string{100} area_id:integer nombre_area:string:{200} empresa_id:integer nombre_empresa:string{200} user_created_id:integer user_updated_id:integer estado:string{10} user:references
	
/*#####################################################################################################################################################################################################*/	
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de tipo_usuario
	rails generate scaffold tipo_usuario nombre:string{50} descripcion:text empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:usuario_procesos
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de macro_proceso
	rails generate scaffold macro_proceso nombre:string{100} descripcion:text abreviatura:string{5} empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:procesos
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de tipo_proceso
	rails generate scaffold tipo_proceso nombre:string{100} descripcion:text abreviatura:string{5} empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:procesos
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de proceso, con referencia al modelo(tabla) macro_proceso y tipo_proceso
	rails generate scaffold proceso nombre:string{100} descripcion:text abreviatura:string{5} empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5} macro_proceso:references tipo_proceso:references
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:usuario_procesos 
	has_many		:sub_procesos
	has_many		:documentos
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de usuario_proceso, con referencia al modelo(tabla) tipo_usuario y proceso
	rails generate scaffold usuario_proceso nombre:string{50} descripcion:text empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5} tipo_usuario:references proceso:references
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:usuario_proceso_permisos

/*#####################################################################################################################################################################################################*/	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de usuario_proceso_permiso, con referencia al modelo(tabla) usuario_proceso y opcion_ca
	-- NOTA: Debe estar creado la tabla de usuario proceso, para poder referenciar en el
	rails generate scaffold usuario_proceso_permiso descripcion:text user_created_id:integer user_updated_id:integer estado:string{5} usuario_proceso:references opcion_ca:references
	
/*#####################################################################################################################################################################################################*/	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de sesion
	rails generate controller session session_id:string data:text
	
/*#####################################################################################################################################################################################################*/			
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de etapa_documento
	rails generate scaffold etapa_documento nombre:string{50} descripcion:text user_created_id:integer user_updated_id:integer estado:string{5}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:estado_documentos
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de etapa_solicitud
	rails generate scaffold etapa_solicitud nombre:string{50} descripcion:text empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5}

/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de tipo_documento
	rails generate scaffold tipo_documento nombre:string{50} descripcion:text abreviatura:string{5} empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:documentos
			
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de tipo_sistema
	rails generate scaffold tipo_sistema nombre:string{100} descripcion:text abreviatura:string{5} empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5}
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:documentos
				
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de estado_documento, con referencia al modelo(tabla) etapa_documento
	rails generate scaffold estado_documento nombre:string{50} descripcion:text empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5} etapa_documento:references
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de sub_proceso, con referencia al modelo(tabla) proceso
	rails generate scaffold sub_proceso nombre:string{100} descripcion:text empresa_id:integer user_created_id:integer user_updated_id:integer estado:string{5} proceso:references
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de documento, con referencia al modelo(tabla) empresa, proceso, tipo_sistema y tipo_documento
	rails generate scaffold documento codigo:string{20} nombre:string{50} fecha_vigencia:datetime version:integer descripcion:text estado_documento_id:integer user_created_id:integer user_updated_id:integer estado:string{5} empresa:references proceso:references tipo_sistema:references tipo_documento:references
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:historial_documentos
	has_many		:solicitud_de_cambios
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de historial_documento, con referencia al modelo(tabla) documento
	rails generate scaffold historial_documento codigo:string{20} nombre:string{50} fecha_vigencia:datetime version:integer descripcion:text empresa_id:integer proceso_id:integer tipo_sistema_id:integer tipo_documento_id:integer estado_documento_id:integer user_created_id:integer user_updated_id:integer estado:string{5} documento:references
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de solicitud_cambio, con referencia al modelo(tabla) documento
	rails generate scaffold solicitud_cambio codigo:string{20} nombre:string{50} version:integer version_propuesto:integer fecha_solicitud:datetime descripcion:text empresa_id:integer proceso_id:integer tipo_sistema_id:integer tipo_documento_id:integer estado_documento_id:integer etapa_solicitud_id:integer user_created_id:integer user_updated_id:integer estado:string{5} documento:references
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:seguimiento_solicitudes
	
/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de seguimiento_solicitud, con referencia al modelo(tabla) solicitud_cambio
	rails generate scaffold seguimiento_solicitud codigo:string{20} nombre:string{50} version:integer version_propuesto:integer fecha_seguimiento:datetime fecha_autorizo:datetime descripcion:text empresa_id:integer proceso_id:integer tipo_sistema_id:integer tipo_documento_id:integer estado_documento_id:integer etapa_solicitud_id:integer user_created_id:integer user_updated_id:integer estado:string{5} solicitud_cambio:references
	
	/*##### Relacion de modelo(s) (tablas) #####*/
	has_many		:comentarios

/*******************************************************************************************************************************************************************************************************/
--	Creación scaffold de comentario, con referencia al modelo(tabla) seguimiento_solicitud
	rails generate scaffold comentario codigo:string{20} version:integer fecha_seguimiento:datetime descripcion:text empresa_id:integer proceso_id:integer tipo_sistema_id:integer tipo_documento_id:integer estado_documento_id:integer etapa_solicitud_id:integer solicitud_cambio_id:integer user_created_id:integer user_updated_id:integer estado:string{5} seguimiento_solicitud:references