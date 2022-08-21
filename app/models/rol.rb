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
class Rol < ApplicationRecord
  validates_presence_of :nombre, :descripcion, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: :estado, message: "El nombre que intenta registrar ya existe" }

  has_many :menu_roles
end
