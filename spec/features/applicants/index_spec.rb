require 'rails_helper'

RSpec.describe 'Applicants' do
  describe '#index' do
    applicant_1 = Applicant.create!(name: 'foo bar')
    applicant_2 = Applicant.create!(name: 'baz foo')
    it 'lists all applicants' do
      visit '/applicants'
      expect(page).to have_content(applicant_1.name)
    end
  end
end