class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_one_attached :image
  has_many :groups
  has_many :budgetting_transactions

  validates :name, presence: { message: "Name can't be blank" }
  validates :email, presence: { message: "Email can't be blank" }
end
