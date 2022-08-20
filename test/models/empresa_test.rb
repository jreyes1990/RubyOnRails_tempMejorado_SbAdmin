# == Schema Information
#
# Table name: empresas
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  descripcion     :text
#  codigo_empresa  :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class EmpresaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
