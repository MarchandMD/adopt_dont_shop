class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:applicant_id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(applications_params)

    if @application.save
      redirect_to "/applications/#{Application.last.id}"
    else
      render 'new'
    end
  end

  private

  def applications_params
    params.require(:applications).permit(:name, :address, :city, :state, :zip_code, :description, :status, :submitted)
  end

end