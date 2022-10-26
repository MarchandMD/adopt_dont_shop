class UpdateDefaultValueOnApplicationPets < ActiveRecord::Migration[5.2]
  def change
    change_column_default :application_pets, :status, to: 0
  end
end
