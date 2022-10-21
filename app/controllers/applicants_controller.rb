class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all
  end
end
