# == Schema Information
#
# Table name: opciones
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  icono           :text
#  path            :text
#  descripcion     :text
#  controlador     :string(300)
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  menu_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class OpcionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
