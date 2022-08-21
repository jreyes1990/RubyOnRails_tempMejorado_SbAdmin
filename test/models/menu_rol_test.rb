# == Schema Information
#
# Table name: menu_roles
#
#  id              :bigint           not null, primary key
#  menu_padre      :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  rol_id          :bigint           not null
#  opcion_id       :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class MenuRolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
