# == Schema Information
#
# Table name: opcion_cas
#
#  id              :bigint           not null, primary key
#  descripcion     :text
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  componente_id   :bigint           not null
#  atributo_id     :bigint           not null
#  opcion_id       :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class OpcionCaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
