class AddApplicantRefToApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :applications, :applicant, foreign_key: true
  end
end
