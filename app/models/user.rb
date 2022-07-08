class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_one_attached :image
  has_many :groups
  has_many :budgetting_transactions

  validates :name, presence: true
  validates :email, presence: true
  validates :image, presence: true
end
