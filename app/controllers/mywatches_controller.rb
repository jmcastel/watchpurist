class MywatchesController < ApplicationController

	before_action :authenticate_user!

	def index
		@posts = Post.where(user_id: current_user).order('created_at DESC').paginate(:page => params[:page], :per_page => 4)
		
	end

end
