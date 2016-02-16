class UsersController < ApplicationController

	def index
		@users = User.all
		@meta_title = "All users"
		@meta_description = "All users present on watchpurist"
	end

	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id: @user).order('created_at DESC').paginate(:page => params[:page], :per_page => 4)
		@meta_title = @user.pseudo
		@meta_description = @user.pseudo + " profile"
		
	end
end
