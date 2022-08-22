module ApplicationHelper

  def current_user_name
    persona = Persona.where("user_id = ? ", current_user.id).first
    if (persona != nil) then
      if (persona.nombre != nil || persona.apellido != nil)
        return persona.nombre.upcase + " " + persona.apellido.upcase
      else
        return current_user.email
      end
    else
      return current_user.email
    end
  end

  def is_active_action(controller)
    if params[:controller] == controller
      "collapse-item active"
    else
      "collapse-item"
    end
  end

  def is_home_active
    if params[:controller] == "home"
      "nav-item active"
    else
      "nav-item"
    end
  end

  def is_active_controller_configuracion_titulo
    @controladores = ["usuarios", "roles", "personas_areas", "menus", "opciones", "menu_roles", "atributos", "componentes", "opcion_cas", "persona_empresa_formularios", "empresas", "areas"]
    if @controladores.include? params[:controller]
      "nav-item active"
    else
      "nav-item"
    end
  end

  def is_active_controller_configuracion
    @controladores = ["usuarios", "roles", "personas_areas", "menus", "opciones", "menu_roles", "atributos", "componentes", "opcion_cas", "persona_empresa_formularios", "empresas", "areas"]
    if @controladores.include? params[:controller]
      "nav-link"
    else
      "nav-link collapsed"
    end
  end

  def is_active_option_controller_configuracion
    @controladores = ["usuarios", "roles", "personas_areas", "menus", "opciones", "menu_roles", "atributos", "componentes", "opcion_cas", "persona_empresa_formularios", "empresas", "areas"]
    if @controladores.include? params[:controller]
      "collapse show"
    else
      "collapse"
    end
  end
end
