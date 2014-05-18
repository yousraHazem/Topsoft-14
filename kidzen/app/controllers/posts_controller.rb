class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

# GET /posts
# GET /posts.json
# Here we are assigning variables @posts and @post
# Parameters : None
# returns : None
# Author : Abdelrahman S. Elsayed
  def index
    @posts = Post.find(:all, :order => 'posts.created_at DESC')
    @post = Post.new
  end

# GET /posts/1
# GET /posts/1.json
# Here we direct our post show page to our index html file
# Parameters : None
# returns : None
# Author : Abdelrahman S. Elsayed
  def show
      redirect_to index 
  end

# GET /posts/new
# Here we create a new instance of post
# Parameters : None
# returns : None
# Author : Abdelrahman S. Elsayed
  def new
  end

# GET /posts/1/edit
  def edit
  end

# POST /posts
# POST /posts.json
# Here we make a new post with parameters and add it to our database
# This method checks if the user is not a supervisor to be allowed to create a 
# new post.
# Parameters : None
# returns : None
# Author : Abdelrahman S. Elsayed , Shary Beshara
  def create
   #if ! Supervisor.exists?(registered_user: current_user)
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post}
        format.json { render action: 'show', status: :created, location: @post }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

# PATCH/PUT /posts/1
# PATCH/PUT /posts/1.json
# Here we update our post's attributes
# Parameters : None
# returns : None
# Author : Abdelrahman S. Elsayed
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /posts/1
# DELETE /posts/1.json
# Here we delete an instance of post
# Parameters : None
# returns : None
# Author : Abdelrahman S. Elsayed
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
# Here we set our variable @post to a certaing post by id
# Parameters : None
# returns : None
# Author : Abdelrahman S. Elsayed
    def set_post
      @post = Post.find(params[:id])
    end

# Never trust parameters from the scary internet, only allow the white list through.
# Here we define our post attributes
# Parameters : None
# returns : None
# Author : Abdelrahman S. Elsayed
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
