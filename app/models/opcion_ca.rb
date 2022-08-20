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
class OpcionCa < ApplicationRecord
  belongs_to :componente
  belongs_to :atributo
  belongs_to :opcion

  validates_presence_of :opcion_id, :componente_id, :atributo_id, :descripcion, message: ": este campo es obligatorio"
  validates_uniqueness_of :opcion_id, :scope => [:componente_id, :atributo_id], :message => " error!! solo puede asignar una vez el componente y el atributo al formulario"
end
