class ChangePetStatusToStatus < ActiveRecord::Migration[5.2]
  def change
    rename_column :application_pets, :pet_status, :status
  end
end
