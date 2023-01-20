class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  enum status: {
    pending: 0,
    approved: 1,
    rejected: 2
  }

  def find_pet_name
    pet.name
  end
end