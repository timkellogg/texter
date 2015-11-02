class User < ActiveRecord::Base
  has_many :contacts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
