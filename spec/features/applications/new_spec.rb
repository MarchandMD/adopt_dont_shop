require 'rails_helper'

RSpec.describe 'Applications' do
  describe '#new' do
    it 'has a new application to be completed' do
      visit '/applications/new'
      fill_in "Name",	with: "Fuzz Sqrl"
      fill_in "Address", with: "2 some st"
      fill_in "City",	with: "BigCity"
      fill_in "State", with: "AA"
      fill_in "Zip Code", with: "23456"
      fill_in "Description", with: "because"
      click_button("submit")
      expect(page).to have_content("Fuzz Sqrl")
    end
  end
end