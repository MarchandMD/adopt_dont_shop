class AdminapplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])

    if params.include?(:pet_id)
      @pet = Pet.find(params[:pet_id])
      @pet.update(adoption_params)
    elsif params.include?(:status)
      @application.update(status_params)
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
