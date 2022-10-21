require 'rails_helper'

RSpec.describe Applicant, type: :model do
  it { should have_many :applications }
end
