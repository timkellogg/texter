require 'rails_helper'

describe Contact do
  it { should validate_presence_of :phone_number }
  it { should validate_presence_of :name }
  it { should belong_to :user }
  it { should have_and_belong_to_many :messages }
end
