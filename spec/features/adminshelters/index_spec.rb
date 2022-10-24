require 'rails_helper'


RSpec.describe 'AdminShelters' do
  describe 'index' do
    before(:each) do
      @shelter1 = Shelter.create!(name: 'AAA Shelter', city: 'FooCity', rank: 1)
      @shelter2 = Shelter.create!(name: 'ZZZ Shelter', city: 'FooCity', rank: 3)
      @shelter3 = Shelter.create!(name: 'BBB Shelter', city: 'FooCity', rank: 2)

      @pet1 = @shelter1.pets.create!(name: 'Dog', age: 3, breed: 'Breed', shelter_id: @shelter1.id)

      @pet1.applications.create!(name: 'Foo Bar', address: '1 foo st', city: 'Foocity', state: 'FooState', zip_code: 12345, description: 'because', status: 'Pending', submitted: false)
    end

    it 'shows all shelters to be administered' do
      visit '/admin/shelters'

      within "#shelters" do
        expect(page).to have_content(@shelter1.name)
        expect(page).to have_content(@shelter2.name)
        expect(page).to have_content(@shelter3.name)
      end
    end

    it 'has a section for pending apps' do
      visit '/admin/shelters'
      expect(page).to have_content("Shelters with Pending Applications")
      expect(page).to have_content(@shelter1.name)
    end
  end
end