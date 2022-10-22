class UpdateApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :applicant_id
  end
end
