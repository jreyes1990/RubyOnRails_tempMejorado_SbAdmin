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
class MenuRol < ApplicationRecord
  belongs_to :rol
  belongs_to :opcion

  validates :rol_id, :opcion_id, presence: true
  validates_uniqueness_of :rol_id, :scope => :opcion_id, :message => " error!! solo puede asignar una la opcion al rol"
end
