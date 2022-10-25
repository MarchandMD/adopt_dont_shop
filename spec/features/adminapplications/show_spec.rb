require 'rails_helper'

RSpec.describe 'Adminapplications' do
  describe '#show' do
    before(:each) do
      @application = Application.create!(name: 'foo bar', address: '1 main st', city: 'city', state: 'state', zip_code: 12345, status: 'in progress', description: 'hello world',  submitted: false)

      @shelter = Shelter.create!(name: 'Shelter_foo', rank: 1, city: 'fooCity')

      @fido = Pet.create!(name: 'fido', age: 5, adoptable: true, breed: 'breed', shelter_id: @shelter.id)

      @application.pets << @fido
    end

    it 'allows an animal to be approved for adoption' do
      visit "/admin/applications/#{@application.id}"
      expect(page).to have_button('Approve this Pet')
      click_button('Approve this Pet')
      expect(page).not_to have_button('Approve this Pet')
      expect(page).to have_content('This pet has been approved for adoption')
    end

    it 'can reject a pet for adoption' do
      visit "/admin/applications/#{@application.id}"
      expect(page).to have_button('Reject this Application')
      click_button('Reject this Application')
      expect(current_path).to eq("/admin/applications/#{@application.id}")
      expect(page).to have_content('This application has been rejected for adoption')
    end


  end

end