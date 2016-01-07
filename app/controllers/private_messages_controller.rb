class PrivateMessagesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_message, only: [:show, :edit, :update, :destroy]
	before_action :set_post , only: [:new, :create]

	def index
		@privatemessages = PrivateMessage.where(user_id: current_user).order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
		@posts = Post.all
	end

	def new
		@privatemessage = PrivateMessage.new
	end

	def show
		@posts = Post.all
	end

	def create 
		@privatemessage = PrivateMessage.new(private_message_params)
		
		@privatemessage.post_id = @post.id

		@privatemessage.user_id = @post.user_id
		@privatemessage.from_user = current_user.id
		@privatemessage.email = current_user.email
		@privatemessage.poster_email = @post.user.email 
		@privatemessage.pseudo = @post.user.pseudo
		@privatemessage.post_title = @post.title 

		if @privatemessage.save
			flash[:notice] = "Your message was sent successfully !"
			redirect_to @post

		else
			render 'new'
		end
	end

	def destroy
		@privatemessage.destroy
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
