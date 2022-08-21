Rails.application.routes.draw do
  get 'usuarios/index'
  get 'usuarios/agregar_usuario'
  #get 'personas/show'
  #get 'persona/edit'

  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  scope "/admin" do
    #Manejo de controller atributo
    resources :atributos
    get 'atributo/inactivar/:id' => "atributos#inactivar_atributo", as: 'inactivar_atributo'

    #Manejo de controller componente
    resources :componentes
    get 'componente/inactivar/:id' => "componentes#inactivar_componente", as: 'inactivar_componente'

    #Manejo de controller menu
    resources :menus
    get 'menu/inactivar/:id' => "menus#inactivar_menu", as: 'inactivar_menu'

    #Manejo de controller Opciones
    resources :opciones
    get 'opcion/inactivar/:id' => "opciones#inactivar_opcion", as: 'inactivar_opcion'

    #Manejo de controller opcion componentes - atributos
    resources :opcion_cas
    get 'opcion_ca/inactivar/:id' => "opcion_cas#inactivar_opcion_ca", as: 'inactivar_opcion_ca'

    #Manejo controller rol
    resources :roles
    get 'rol/inactivar/:id' => "roles#inactivar_rol", as: 'inactivar_rol'

    #Manejo de controller menu por rol
    resources :menu_roles
    get 'menu_rol/inactivar/:id' => "menu_roles#inactivar_menurol", as: 'inactivar_menu_rol'

    #Manejo controller empresas
    resources :empresas
    get 'empresa/inactivar/:id' => "empresas#inactivar_empresa", as: 'inactivar_empresa'

    #Manejo controller areas
    resources :areas
    get 'area/inactivar/:id' => "areas#inactivar_area", as: 'inactivar_area'

    #manejo de controller peresonas - areas
    resources :personas_areas
    get 'usuario_area/inactivar/:id' => "personas_areas#inactivar_usuario_area", as: 'inactivar_usuario_area'
    get "personas_areas/search_areas_by_empresa"

    #manejo de controller personas - empresa - formularios
    resources :persona_empresa_formularios
    get "permisos/" => "persona_empresa_formularios#index_permisos", :as => "permisos"
    post "persona_empresa_formularios/consulta_permisos"
    get "/permisos/search" => "persona_empresa_formularios#search_usuario", as: "search_usuarios"
    get "/permisos/show" => "persona_empresa_formularios#mostrar_permisos", as: "mostrar_permisos"
    get "/permisos/add" => "persona_empresa_formularios#agregar_permiso", as: "agregar_permisos"
    get "/permisos/showadd" => "persona_empresa_formularios#mostrar_agregar_permisos", as: "mostrar_agregar_permisos"
    post "persona_empresa_formularios/guardar_permisos"
    get "/permisos/opc_perfil" => "persona_empresa_formularios#obtener_opciones_por_perfil", as: "obtener_opciones_por_perfil"
    get "/permisos/opc_individual" => "persona_empresa_formularios#obtener_opciones_por_individual", as: "obtener_opciones_por_individual"
    delete "/permisos/remove/:id" => "persona_empresa_formularios#eliminar_permiso", as: "eliminar_permiso"

    #Manejo controller Personas
    resources :personas
    get 'personas/show/:id' => "personas#show", as: 'ver_perfil'
    patch 'personas/update'
    get 'inactivar/:id' => "personas#inactivar", as: 'inactivar_usuario'

    #Manejo controller Usuarios
    post 'usuarios/crear_usuario'
    get 'usuarios/index'
    get 'usuarios/agregar_usuario'
  end
  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
