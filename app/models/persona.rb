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
class Persona < ApplicationRecord
  mount_uploader :foto, FotoUploader
  belongs_to :user

  validates :nombre, :apellido, :direccion, :telefono, presence: false

  has_many :personas_areas

  def nombre_completo
    "#{self.nombre} #{self.apellido}"
  end

  def nombre_completo_con_email
    "#{self.nombre} #{self.apellido} - #{self.user.email}"
  end
end
