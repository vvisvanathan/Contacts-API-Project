class ContactsController < ApplicationController
  private
  def contact_params
    params[:contact].permit(:name, :email, :user_id)
  end

  public
  def index
    render json: all_of_the_contacts
  end

  def all_of_the_contacts
    (User.find(params[:user_id]).contacts + User.find(params[:user_id]).shared_contacts).sort { |u1, u2| u1.id <=> u2.id }
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy!
    render json: @contact
  end
end
