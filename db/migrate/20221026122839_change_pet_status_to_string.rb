class ChangePetStatusToString < ActiveRecord::Migration[5.2]
  def change
    change_column :application_pets, :pet_status, :string
  end
end
