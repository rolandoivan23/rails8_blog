class ContactController < ApplicationController
  allow_unauthenticated_access
  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to root_path, notice: "Hemos recibido tu peticion"
    end
  end

  private

    def contact_params
      params.expect(contact: [ :name, :mail, :message ])
    end
end
