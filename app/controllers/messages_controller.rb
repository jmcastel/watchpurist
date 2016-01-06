class MessagesController < ApplicationController

	before_action :authenticate_user!

	def index
		
		
		@messages = PrivateMessage.where(user_id: current_user).order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
		
		@posts = Post.all
	end

	def destroy
		@privatemessage.destroy
		redirect_to root_path
	end


end
