require 'rails_helper'

RSpec.describe 'Applicants' do
  describe '#index' do
    applicant_1 = Applicant.create!(name: 'foo bar')
    applicant_2 = Applicant.create!(name: 'baz foo')
    it 'lists all applicants' do
      visit '/applicants'
      expect(page).to have_content(applicant_1.name)
    end

    it 'has links to an applicants application' do
      visit '/applicants'
      expect(page).to have_link(applicant_1.name)
      first(:link, applicant_1.name).click
    end
  end
end