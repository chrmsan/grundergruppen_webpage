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

	def edit
		@member = Member.find(params[:id])
	end
	
	def update  
		@member = Member.find(params[:id])
		if @member.update(post_params)
			flash[:success] = "Member Updated!" 
			redirect_to root_path
		else 
			flash.now[:alert] = "Update failed. Please check the form."
			render :edit
		end
	end  

	def destroy
		@member = Member.find(params[:id])
		@member.destroy
		flash[:success] = "Member has been deleted!"
		redirect_to root_path
	end

	private

	def post_params
		params.require(:member).permit(:name, :image, :company_name, :company_webpage)
	end

end
