class ChangeStatusToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :application_pets, :status, :integer, using: 'status::integer'
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
