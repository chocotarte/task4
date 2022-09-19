class User < ApplicationRecord
  has_one_attached :profile_image
  
  has_many :books, dependent: :destroy
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
