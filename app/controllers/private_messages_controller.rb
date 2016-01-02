class PrivateMessagesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_message, only: [:show, :edit, :update, :destroy]
	before_action :set_post

	def index
		@privatemessages = PrivateMessage.all
	end

	def new
		@privatemessage = PrivateMessage.new
	end

	def create 
		@privatemessage = PrivateMessage.new(private_message_params)
		
		@privatemessage.post_id = @post.id

		@privatemessage.user_id = @post.user_id
		@privatemessage.from_user = current_user.id
		@privatemessage.email = @post.user.email

		if @privatemessage.save
			flash[:notice] = "Your message was sent successfully !"
			redirect_to @post

		else
			render 'new'
		end
	end

	def destroy
		@mprivatemessage.destroy
		redirect_to root_path
	end

	private
		def set_message
			@privatemessage = PrivateMessage.find(params[:id])
		end

		def set_post
			@post = Post.find(params[:post_id])
		end

		
		def private_message_params
      		params[:private_message].permit(:title, :content, :post_id, :user_id)

    	end

end
