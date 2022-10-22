require 'rails_helper'

RSpec.describe 'Applications' do
  describe '#show' do
    application_1 = Application.create!(name: 'foo bar', address: '1 main st', city: 'city', state: 'state', zip_code: 12345, status: 'in progress', description: 'hello world',  submitted: false)
    it 'shows all applicant details' do
      visit "/applications/#{application_1.id}"
      expect(page).to have_content(application_1.name)
      expect(page).to have_content(application_1.address)
      expect(page).to have_content(application_1.city)
      expect(page).to have_content(application_1.state)
      expect(page).to have_content(application_1.zip_code)
      expect(page).to have_content(application_1.description)
      expect(page).to have_content(application_1.status)
    end
  end
end