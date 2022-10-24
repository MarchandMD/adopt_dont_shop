require 'rails_helper'


RSpec.describe 'AdminShelters' do
  describe 'index' do
    before(:each) do
      @shelter1 = Shelter.create!(name: 'AAA Shelter', city: 'FooCity', rank: 1)
      @shelter2 = Shelter.create!(name: 'ZZZ Shelter', city: 'FooCity', rank: 3)
      @shelter3 = Shelter.create!(name: 'BBB Shelter', city: 'FooCity', rank: 2)
    end

    it 'shows all shelters to be administered' do
      visit '/admin/shelters'
      expect(page).to have_content(@shelter1.name)
      expect(page).to have_content(@shelter2.name)
      expect(page).to have_content(@shelter3.name)
    end
  end
end