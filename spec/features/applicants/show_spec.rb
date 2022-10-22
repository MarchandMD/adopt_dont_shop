require 'rails_helper'

RSpec.describe 'Applicant' do
  describe '#show' do
    applicant = Applicant.create!(name: 'Foo')
    it 'shows the applicant name and all applications' do
      visit "/applicants/#{applicant.id}"
      expect(page).to have_content(applicant.name)
    end
  end

end