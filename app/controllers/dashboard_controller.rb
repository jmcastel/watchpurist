class DashboardController < ApplicationController

	before_action :authenticate_user!

	def index
		@posts = Post.where(user_id: current_user).order('created_at DESC').paginate(:page => params[:page], :per_page => 4)
		@messages = PrivateMessage.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)

		@meta_title = "Watchpurist dashboard"
		@meta_description = "Watchpurist dashboard : find all your watches and private messages"
		 
	end


end
