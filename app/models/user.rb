class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_one_attached :image
  has_many :groups

  validates :name, presence: true
  validates :email, presence: true
  validates :image, presence: true
end
