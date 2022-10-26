class AdminapplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @application_pets = ApplicationPet.where(application_id: @application.id)
  end

  def update
    @application = Application.find(params[:id])
    @application_pet = ApplicationPet.find_by(pet_id: params[:pet_id], application_id: params[:id])

    if params[:status] == "1"
      @application_pet.approved!
    elsif params[:status] == "2"
      @application_pet.rejected!
    end

    redirect_to "/admin/applications/#{@application.id}"
  end

  private

  def adoption_params
    params.permit(:adoptable)
  end

  def status_params
    params.permit(:status)
  end
end
