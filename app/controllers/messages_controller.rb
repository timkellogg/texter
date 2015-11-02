class MessagesController < ApplicationController
  before_action :find_message, except: [:new, :create, :index]

  def new
    @message = Message.new
    @contacts = Contact.all
  end

  def create

    @contacts = Contact.all
    @message = Message.new(message_params)

    params[:contact_phone_numbers].each do |contact|
      msg = Message.create!(to: contact, from: @message.from, body: @message.body)
      msg.send_message(msg)
    end

    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def index
    @messages = Message.all
  end

  def show
  end

  def destroy
    @message.destroy
    redirect_to messages_path
  end



private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:to, :from, :body, contact_phone_numbers: [])
  end

end
