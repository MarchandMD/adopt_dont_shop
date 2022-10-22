class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:applicant_id])
  end

  def new
  end

  def create
    Application.create!(application_params)

    redirect_to "/applications/#{Application.last.id}"
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip_code, :description, :status, :submitted)
  end

end