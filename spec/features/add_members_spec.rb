require 'rails_helper'

feature 'Adding a member' do

	scenario 'can add a member to the index page' do
		visit '/'
		click_link "New Member"
		fill_in "Name", with: "Johnny Bravo"
		attach_file('Image', "spec/files/images/johnny_bravo.jpg")
		fill_in "Company Name", with: "Bravo Inc."
		fill_in "Company Website", with: "www.bravo.co"
		click_button "Add Member"
		expect(page).to have_content("Johnny Bravo")
		expect(page).to have_css("img[src*='johnny_bravo.jpg']")
	end
end