# == Schema Information
#
# Table name: menus
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  icono           :text
#  descripcion     :text
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Menu < ApplicationRecord
  validates_presence_of :nombre, :descripcion, :icono, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: :estado, message: "El nombre que intenta registrar ya existe" }

  has_many :opciones
end
