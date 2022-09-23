class V1::SessionsController < ApplicationController
  def index
    @contacts = current_user.contacts

    render :index, status: :ok
  end

  def create
    @contact = current_user.contacts.build(contact_params)

    @contact.save
    render :create, status: :created
  end

  def show

  end

  def destroy

  end
end