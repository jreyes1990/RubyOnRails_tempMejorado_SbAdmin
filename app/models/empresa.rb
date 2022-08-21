# == Schema Information
#
# Table name: empresas
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  descripcion     :text
#  codigo_empresa  :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Empresa < ApplicationRecord
  validates_presence_of :nombre, :descripcion, :codigo_empresa, {message: ": Este campo es obligatorio"}
  validates :nombre, :uniqueness => {case_sensitive: :false, scope: :estado, message: "Error, la empresa que intenta registrar ya existe, Verifique!!." }

  has_many :areas

  def informacion_empresa
    "CÖDIGO: #{self.id} #{self.nombre.upcase}"
  end

  def empresa_con_codigo
    "#{self.id} | #{self.nombre.upcase}"
  end
end
