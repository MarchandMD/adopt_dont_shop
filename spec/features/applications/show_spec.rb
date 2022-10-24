require 'rails_helper'

RSpec.describe 'Applications' do
  describe '#show' do
    before(:each) do
      @application_1 = Application.create!(name: 'foo bar', address: '1 main st', city: 'city', state: 'state', zip_code: 12345, status: 'in progress', description: 'hello world',  submitted: false)

      @shelter = Shelter.create!(name: 'Shelter_foo', rank: 1, city: 'fooCity')

      @shelter.pets.create!(name: 'fido', age: 5, adoptable: true, breed: 'breed')
    end

    it 'shows all applicant details' do
      visit "/applications/#{@application_1.id}"
      expect(page).to have_content(@application_1.name)
      expect(page).to have_content(@application_1.address)
      expect(page).to have_content(@application_1.city)
      expect(page).to have_content(@application_1.state)
      expect(page).to have_content(@application_1.zip_code)
      expect(page).to have_content(@application_1.description)
      expect(page).to have_content(@application_1.status)
    end

    it 'has a section on the page to add a pet' do
      visit "/applications/#{@application_1.id}"
      expect(page).to have_content('Add A Pet to this Application')
    end

    it 'can search for a pet' do
      visit "/applications/#{@application_1.id}"
      fill_in "Search",	with: "fido"
      click_button "Search"
      expect(current_path).to eq("/applications/#{@application_1.id}")
      expect(page).to have_content('fido')
    end

    it 'can add a pet to an application' do
      visit "/applications/#{@application_1.id}"
      fill_in "Search",	with: "fido"
      click_button "Search"
      expect(page).to have_content 'fido'
      expect(page).to have_button "Adopt this Pet"
      first(:button, 'Adopt this Pet').click
      expect(current_path).to eq("/applications/#{@application_1.id}")
      expect(page).to have_content 'fido'
    end

    it 'can update application status to Pending' do

      visit "/applications/#{@application_1.id}"

      fill_in "Search",	with: "fido"
      click_button "Search"
      expect(page).to have_content 'fido'
      expect(page).to have_button "Adopt this Pet"
      first(:button, 'Adopt this Pet').click
      expect(page).to have_content 'fido'
      expect(page).to have_content('Submit My Application')
      expect(page).to have_button('Submit My Application')
      expect(page).to have_content('Why')
      fill_in "Why",	with: "because"
      click_button('Submit My Application')
      expect(page).to have_content('Pending')
      expect(page).to have_content('fido')
      expect(page).not_to have_content('Add A Pet')
    end

    it 'allows submission if a pet has been selected' do
      visit "/applications/#{@application_1.id}"
      expect(page).to have_content('no pets for this application, at this time')
      expect(@application_1.pets).to eq([])
      expect(page).not_to have_content('Submit My Application')
    end
  end


end