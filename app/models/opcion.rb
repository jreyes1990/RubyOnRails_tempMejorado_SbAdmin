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
class Opcion < ApplicationRecord
  belongs_to :menu
  validates_presence_of :nombre, :descripcion, :icono, :path, :controlador, message: ": este campo es obligatorio"

  has_many :opcion_cas

  def nombre_con_menu
    "#{self.menu.nombre} - #{selt.nombre}"
  end
end
