# == Schema Information
#
# Table name: persona_empresa_formularios
#
#  id               :bigint           not null, primary key
#  descripcion      :text
#  user_created_id  :integer
#  user_updated_id  :integer
#  estado           :string(10)
#  opcion_ca_id     :bigint           not null
#  personas_area_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class PersonaEmpresaFormulario < ApplicationRecord
  belongs_to :opcion_ca
  belongs_to :personas_area

  validates_uniqueness_of :personas_area_id, :scope => :opcion_ca_id, :message => " error!! solo puede asignar una vez el permiso"
end
