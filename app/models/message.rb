class Message < ActiveRecord::Base
  # before_create :send_message
  has_and_belongs_to_many :contacts



  # private

  def send_message(message)
    begin
      response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC2a025b06ca2aa65b4dc2cd1abbbd78c6/Messages.json',
      :user => 'AC2a025b06ca2aa65b4dc2cd1abbbd78c6',
      :password => '925053a11eef433c0f37db0e1eb77dda',
      :payload => { :Body => message.body,
                    :To => message.to,
                    :From => message.from }
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
