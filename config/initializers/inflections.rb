# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections(:en) do |inflect|
  #SINGULARES MODULO SGI (SISTEMA DE GESTION INTEGRAL)
  inflect.singular "persona", "personas"
  inflect.singular "empresa", "empresas"
  inflect.singular "menu", "menus"
  inflect.singular "opcion", "opcion"
  inflect.singular "rol", "roles"
  inflect.singular "menu_rol", "menu_roles"
  inflect.singular "atributo", "atributos"
  inflect.singular "componente", "componentes"
  inflect.singular "opcion_ca", "opcion_cas"
  inflect.singular "parametro", "parametros"
  inflect.singular "area", "areas"
  inflect.singular "personas_area", "personas_areas"
  inflect.singular "persona_empresa_formulario", "persona_empresa_formularios"

  #PLURALES MODULO SGI (SISTEMA DE GESTION INTEGRAL)
  inflect.plural "persona", "personas"
  inflect.plural "empresa", "empresas"
  inflect.plural "menu", "menus"
  inflect.plural "opcion", "opciones"
  inflect.plural "rol", "roles"
  inflect.plural "menu_rol", "menu_roles"
  inflect.plural "atributo", "atributos"
  inflect.plural "componente", "componentes"
  inflect.plural "opcion_ca", "opcion_cas"
  inflect.plural "parametro", "parametros"
  inflect.plural "area", "areas"
  inflect.plural "personas_area", "personas_areas"
  inflect.plural "persona_empresa_formulario", "persona_empresa_formularios"


  #IRREGULARES MODULO SGI (SISTEMA DE GESTION INTEGRAL)
  inflect.irregular "persona", "personas"
  inflect.irregular "empresa", "empresas"
  inflect.irregular "menu", "menus"
  inflect.irregular "opcion", "opciones"
  inflect.irregular "rol", "roles"
  inflect.irregular "menu_rol", "menu_roles"
  inflect.irregular "atributo", "atributos"
  inflect.irregular "componente", "componentes"
  inflect.irregular "opcion_ca", "opcion_cas"
  inflect.irregular "parametro", "parametros"
  inflect.irregular "area", "areas"
  inflect.irregular "personas_area", "personas_areas"
  inflect.irregular "persona_empresa_formulario", "persona_empresa_formularios"

end
