require 'rails_helper'

feature 'Editing a Member' do
	background do 
		member = create(:member)
		visit '/'
		find(:xpath, "//a[contains(@href,'members/1')]").click
		click_link "Edit Member"
	end

	scenario "Can edit a member" do
		fill_in "Name", with: "Jonathan Bravo"
		click_button "Update Member"
		expect(page).to have_content("Member updated")
		expect(page).to have_content("Jonathan Bravo")
		expect(page).to_not have_content("Johnny Bravo")
	end
end