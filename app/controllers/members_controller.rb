class MembersController < ApplicationController

	def index
	end

	def new
		@member = Member.new
	end

	def create
		@member = Member.create(post_params)
		redirect_to members_path
	end


	private

	def post_params
		params.require(:member).permit(:name, :image, :company_name, :company_webpage)
	end

end
