class User < ApplicationRecord
  # Include default devise modules. Others available are:

  has_many :videos
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
