require 'rails_helper'

RSpec.describe 'Applications' do
  describe '#show' do
    applicant_1 = Applicant.create!(name: 'foo bar', address: '1 main st', city: 'denver', state: 'co', zip_code: 12345)
    application_1 = applicant_1.applications.create!(status: 'in progress', submitted: false, description: 'i am a good person')
    it 'shows all applicant details' do
      visit "/applications/#{application_1.id}"
      expect(page).to have_content(applicant_1.name)
      expect(page).to have_content(applicant_1.address)
      expect(page).to have_content(applicant_1.city)
      expect(page).to have_content(applicant_1.state)
      expect(page).to have_content(applicant_1.zip_code)
      expect(page).to have_content(application_1.description)
      expect(page).to have_content(application_1.status)
    end
  end
end