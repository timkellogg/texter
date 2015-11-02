class Contact < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :messages

  validates_presence_of :phone_number, :name
end
