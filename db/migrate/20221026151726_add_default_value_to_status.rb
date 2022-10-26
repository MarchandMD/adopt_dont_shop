class AddDefaultValueToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_null :application_pets, :status, 0
  end
end
