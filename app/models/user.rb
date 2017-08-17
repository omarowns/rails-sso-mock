class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments

  enum role: {
    undefined: 0,
    admin: 1,
    patient: 2,
    doctor: 3
  }

  ROLES_FOR_SIGNUP = %w(patient doctor)
end
