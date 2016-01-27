class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id: @user).order('created_at DESC').paginate(:page => params[:page], :per_page => 4)
		
	end
end
