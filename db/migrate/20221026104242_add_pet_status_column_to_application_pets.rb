class AddPetStatusColumnToApplicationPets < ActiveRecord::Migration[5.2]
  def change
    add_column :application_pets, :pet_status, :boolean
  end
end
