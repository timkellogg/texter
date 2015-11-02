class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all.order(name: :desc)
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create

    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to root_path
  end


private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:user_id, :phone_number, :name)
  end

end
