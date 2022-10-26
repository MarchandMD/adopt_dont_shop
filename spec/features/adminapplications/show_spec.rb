require 'rails_helper'

RSpec.describe 'Adminapplications' do
  describe '#show' do
    before(:each) do
      @application = Application.create!(name: 'foo bar', address: '1 main st', city: 'city', state: 'state', zip_code: 12345, status: 'in progress', description: 'hello world',  submitted: false)
      @application_2 = Application.create!(name: 'Mr. Baz Bar', address: '2 main st', city: 'city', state: 'state', zip_code: 12345, status: 'in progress', description: 'hello world',  submitted: false)

      @shelter = Shelter.create!(name: 'Shelter_foo', rank: 1, city: 'fooCity')

      @fido = Pet.create!(name: 'fido', age: 5, adoptable: true, breed: 'breed', shelter_id: @shelter.id)

      @application.pets << @fido
      @application_2.pets << @fido
    end

    it 'allows an animal to be approved for adoption' do
      visit "/admin/applications/#{@application.id}"
      expect(page).to have_button('approve this pet')
      click_button('approve this pet')
      expect(page).not_to have_button('approve this pet')
      expect(page).to have_content('approved')
    end

    it 'can reject a pet for adoption' do
      visit "/admin/applications/#{@application.id}"
      expect(page).to have_button('reject this pet')
      click_button('reject this pet')
      expect(current_path).to eq("/admin/applications/#{@application.id}")
      expect(page).to have_content('rejected')
    end

    it 'Can approve/reject duplicate pets on separate applications' do
      expect(@application.pets.first).to eq(@fido)
      expect(@application_2.pets.first).to eq(@fido)
      visit "/admin/applications/#{@application.id}"
      expect(page).to have_button('approve this pet')
      expect(page).to have_button('reject this pet')
      click_button('approve this pet')
      expect(page).to have_content('approved')
      visit "/admin/applications/#{@application_2.id}"
      expect(page).to have_button('approve this pet')
    end

  end

end