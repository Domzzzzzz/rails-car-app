require 'rails_helper'
RSpec.feature "GoTimes", type: :feature do

context "when I visit the welcome page" do
  context "as an internet user" do
    it "shows welcome to the car simulator" do
      visit '/car/my_auto'
      expect(page).to have_content("Welcome to my Car Simulator Budday!")
    end

    it "I am asked for make and model year of the car to be simulated." do
      visit '/car/my_auto'
      expect(page).to have_field("make")
      expect(page).to have_field("year")
    end

    it "after entering make and year, and clicking the button labelled 'Submit', I am taken to a status page" do
      visit_welcome_and_fill_in_make_and_model
      expect(page).to have_field('make', with: "Ford")
      expect(page).to have_field("year", with: "1986")
      click_button 'Submit'
      expect(page.current_path).to eq('/car/status')
    end

    it "after filling out the welcome page, I am taken to a status page showing the make and model year of the car" do
      visit_welcome_and_fill_in_make_and_model
      click_button 'Submit'
      expect(page).to have_content("Ford")
      expect(page).to have_content("1986")
    end
  end
end

def visit_welcome_and_fill_in_make_and_model
  visit '/car/my_auto'

  within("form#make_model") do
    fill_in("make", with: 'Ford')
    fill_in("year", with: '1986')
  end
end






end #final end
