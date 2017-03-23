require 'rails_helper'

feature 'Adding a member' do

	scenario 'can add a member to the index page' do
		visit '/'
		click_link "Add New Member"
		fill_in "Name", with: "Johnny Bravo"
		attach_file('Image', "spec/files/images/johnny_bravo.jpg")
		fill_in "Company name", with: "Bravo Inc."
		fill_in "Company webpage", with: "www.bravo.co"
		click_button "Create Member"
		expect(page).to have_content("Johnny Bravo")
		expect(page).to have_css("img[src*='johnny_bravo.jpg']")
	end

	scenario 'needs and to create a member' do
		visit '/'
		click_link 'Add New Member'
		fill_in "Name", with: "Johnny Bravo"
		fill_in "Company name", with: "Bravo Inc."
		fill_in "Company webpage", with: "www.bravo.co"
		click_button "Create Member"
		expect(page).to have_content("You need an image to create a member.")
	end

end