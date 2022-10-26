class CorrectDefaultValueToZeroOnApplicationPets < ActiveRecord::Migration[5.2]
  def change
    change_column_default :application_pets, :status, 0
  end
end
