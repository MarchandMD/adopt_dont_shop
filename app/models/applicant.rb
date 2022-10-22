class Applicant < ApplicationRecord
  has_many :applications, dependent: :destroy
end
