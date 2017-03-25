require 'rails_helper'

feature 'Editing a Member' do
	background do 
		user = create(:user)
		member = create(:member)
		sign_in_with(user)
		visit '/'
		find("a[href='#{edit_member_path(member)}']").click
	end

	scenario "Can edit a member" do
		fill_in "Name", with: "Jonathan Bravo"
		click_button "Update Member"
		expect(page).to have_content("Member Updated!")
		expect(page).to have_content("Jonathan Bravo")
		expect(page).to_not have_content("Johnny Bravo")
	end
end