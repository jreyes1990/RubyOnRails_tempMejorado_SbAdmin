# == Schema Information
#
# Table name: personas_areas
#
#  id              :bigint           not null, primary key
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  area_id         :bigint           not null
#  persona_id      :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class PersonasAreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
