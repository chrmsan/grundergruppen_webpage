class MembersController < ApplicationController

	def index
		@members = Member.all
	end

	def new
		@member = Member.new
	end

	def create
		@member = Member.create(post_params)
		if @member.save
			flash[:success] = "A member has been added."
			redirect_to root_path
		else
			flash[:alert] = "You need an image to create a member."
			render :new
		end
	end


	private

	def post_params
		params.require(:member).permit(:name, :image, :company_name, :company_webpage)
	end

end
