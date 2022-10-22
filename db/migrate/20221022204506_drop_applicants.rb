class DropApplicants < ActiveRecord::Migration[5.2]
  def change
    drop_table :applicants
  end
end
