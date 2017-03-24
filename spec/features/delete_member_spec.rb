require 'rails_helper'

feature 'Deleting a Member' do
	background do 
		member = create(:member)
		visit '/'
		find("a[href='#{edit_member_path(member)}']").click
	end

	scenario "Can delete a member" do
		click_link "Delete Member"
		expect(page).to have_content("Member has deleted!")
		expect(page).to_not have_content("Johnny Bravo")
	end
end