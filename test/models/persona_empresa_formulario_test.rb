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
require 'test_helper'

class PersonaEmpresaFormularioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
