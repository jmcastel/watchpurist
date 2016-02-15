class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  impressionist :actions=>[:show]

  # GET /posts
  # GET /posts.json
 def index
    @meta_title = 'Watchpurist : buy or sell luxury watches'
    s = :q 
     

    @query = params.fetch(:q, "*").presence || "*"
    conditions = {}
    conditions[:brand] = params[:brand] if params[:brand].present?
    conditions[:model] = params[:model] if params[:model].present?
    if conditions[:brand].present?

      @meta_description = "Buy " + conditions[:brand] + " watches on watchpurist"

    else 
      @meta_description = "Latest watches available on watchpurist"
    end

    @posts = Post.search(@query, fields: [:title, :brand, :model], match: :word_start, operator: "or", order: {created_at: :desc} , where: conditions, aggs: [:brand,:model],page: params[:page], per_page: 16)
    @posts_alphabet = Post.search(@query, fields: [:title, :brand, :model], match: :word_start, operator: "or", order: {created_at: :desc} , where: conditions, aggs: {brand: {order: {"_term" => "asc"}}},page: params[:page], per_page: 16) 

    #@posts = Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 4)
  end

  

  # GET /posts/1
  # GET /posts/1.json
  def show
    if request.path != post_path(@post)
      return redirect_to @post, status => :moved_permanently
    end

    impressionist(@post)
    @meta_title = "watch " + @post.brand + " model " + @post.model + " year " + @post.year
    @meta_description = "watch " + @post.brand + " model " + @post.model + " year " + @post.year + " " + @post.description
  end

  # GET /posts/new
  def new
    @post = current_user.post.build
    @meta_title = "Sell a new watch"
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.post.build(post_params)

    
    if @post.save
      flash[:notice] = "Post successfully created !"
      redirect_to @post

    else
      render 'new'
        
      
    end
    
  end

  # GET /posts/1/edit
  def edit
     
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    
    respond_to do |format|
      if @post.update(post_params)
        
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:remove_image, 
        :remove_image2, 
        :remove_image3 ,
        :contact_us,
        :title, 
        :description, 
        :brand, 
        :model, 
        :price, 
        :currency, 
        :image, :image2, :image3, 
        :year, 
        :availability, 
        :condition, 
        :location, 
        :shipping, 
        :movement, 
        :bracelet, 
        :case, 
        :dial, 
        :functions, 
        pictures_attributes: [ :id, :post_id, :image, :_destroy])
    end
end
