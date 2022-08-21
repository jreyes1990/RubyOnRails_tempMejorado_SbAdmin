# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  user_created_id        :integer
#  user_updated_id        :integer
#  estado                 :string(10)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :persona, dependent: :destroy
  after_create :set_persona

  def set_persona
    self.persona = Persona.create
  end

  def active_for_authentication?
    if self.estado == 'I'
      super && false
    else
      super && true
    end
  end
end
