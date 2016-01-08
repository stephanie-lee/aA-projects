class ContactsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    shared_contacts = user.shared_contacts
    contacts = user.contacts
    render json: contacts + shared_contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact
  end

  def update
    contact = Contact.find_by(id: params[:id])

    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])

    if contact.destroy
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def contact_params
    params.require(:contact).permit(:user_id, :name, :email)
  end
end
