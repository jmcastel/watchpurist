class MessagesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_message , only: [:show]

	def index
		
		
		@messages = PrivateMessage.where(user_id: current_user).order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
		
		@posts = Post.all
	end

	def destroy
		@message.destroy
		redirect_to root_path
	end

	def show

		
		@posts = Post.all
	end

	private
		def set_message
			@message = PrivateMessage.find(params[:id])
		end

end
