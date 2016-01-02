class MessagesController < ApplicationController

	before_action :authenticate_user!

	def index
		
		@messages = PrivateMessage.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
		 
	end


end
