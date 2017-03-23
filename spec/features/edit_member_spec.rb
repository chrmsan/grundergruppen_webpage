require 'rails_helper'

feature 'Editing a Member' do
	background do 
		member = create(:member)
		visit '/'
		find("a[href='#{edit_member_path(member)}']").click
		#click_link "Edit Member"
	end

	scenario "Can edit a member" do
		fill_in "Name", with: "Jonathan Bravo"
		click_button "Update Member"
		expect(page).to have_content("Member Updated!")
		expect(page).to have_content("Jonathan Bravo")
		expect(page).to_not have_content("Johnny Bravo")
	end
end