require 'rails_helper'

feature 'Adding a member' do
	
	background do 
		user = create(:user)
		sign_in_with(user)
	end

	scenario 'can add a member to the index page' do
		click_link "Add New Member"
		fill_in "Name", with: "Johnny Bravo"
		attach_file('Image', "spec/files/images/johnny_bravo.jpg")
		fill_in "Company name", with: "Bravo Inc."
		fill_in "Company webpage", with: "www.bravo.co"
		click_button "Create Member"
		expect(page).to have_content("Johnny Bravo")
		expect(page).to have_css("img[src*='johnny_bravo.jpg']")
	end

	scenario 'needs an image to create a member' do
		click_link 'Add New Member'
		fill_in "Name", with: "Johnny Bravo"
		fill_in "Company name", with: "Bravo Inc."
		fill_in "Company webpage", with: "www.bravo.co"
		click_button "Create Member"
		expect(page).to have_content("You need an image to create a member.")
	end

end