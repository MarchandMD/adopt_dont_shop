class AdminsheltersController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql('select * from shelters order by name desc')
    @applications = Application.all
  end
end
