# == Schema Information
#
# Table name: areas
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  descripcion     :text
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  empresa_id      :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Area < ApplicationRecord
  belongs_to :empresa

  validates :nombre, :descripcion, :empresa_id, presence: true

  def nombre_area_empresa
    "#{self.empresa.nombre.upcase} - #{self.nombre.upcase}"
  end

  def nombre_con_codigo
    "#{self.id} | AREA: #{self.nombre.upcase}"
  end
end
