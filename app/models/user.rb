class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, class_name: 'Appointment', foreign_key: 'user_id'
  validates :name, :email, :password, presence: true, length: { minimum: 3, maximum: 50 }
end
