# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  descripcion     :text
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class RolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
