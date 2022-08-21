# == Schema Information
#
# Table name: personas
#
#  id              :bigint           not null, primary key
#  nombre          :string(100)
#  apellido        :string(100)
#  foto            :string
#  telefono        :integer
#  direccion       :text
#  token           :string(1000)
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class PersonaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
