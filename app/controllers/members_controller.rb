class MembersController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_action :set_member, only: [:edit, :update, :destroy]

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
			flash[:alert] = "You need both a name and an image to create a member."
			render :new
		end
	end

	def edit
	end
	
	def update  
		if @member.update(post_params)
			flash[:success] = "Member Updated!" 
			redirect_to root_path
		else 
			flash.now[:alert] = "Update failed. Please check the form."
			render :edit
		end
	end  

	def destroy
		@member.destroy
		flash[:success] = "Member has been deleted!"
		redirect_to root_path
	end

	private

	def post_params
		params.require(:member).permit(:name, :image, :company_name, :company_webpage)
	end

	def set_member
		@member = Member.find(params[:id])
	end

end
