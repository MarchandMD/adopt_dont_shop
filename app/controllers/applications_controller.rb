class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])

    if params.include?(:search)
      @pets = Pet.search(params[:search].downcase)
    end

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

  def update
    @application = Application.find(params[:id])

    if params[:status] == 'Pending'
      @application.update(status: params[:status], description: params[:description])
    else
      @application.pets << Pet.where(name: params[:search])
    end

    redirect_to "/applications/#{@application.id}"
  end

  private

  def applications_params
    params.require(:applications).permit(:name, :address, :city, :state, :zip_code, :description, :status, :submitted, :search)
  end

  def search_params
    params.permit(:search)
  end

end