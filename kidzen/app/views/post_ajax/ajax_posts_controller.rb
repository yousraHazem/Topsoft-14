class AjaxPostsController < ApplicationController
  before_action :set_ajax_post, only: [:show, :edit, :update, :destroy]

  # GET /ajax_posts
  # GET /ajax_posts.json
  def index
    @ajax_posts = AjaxPost.all
  end

  # GET /ajax_posts/1
  # GET /ajax_posts/1.json
  def show
  end

  # GET /ajax_posts/new
  def new
  end

  # GET /ajax_posts/1/edit
  def edit
  end

  # POST /ajax_posts
  # POST /ajax_posts.json
  def create
    @ajax_post = AjaxPost.new(ajax_post_params)

    respond_to do |format|
      if @ajax_post.save
        format.html { redirect_to @ajax_post, notice: 'Ajax post was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @ajax_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ajax_posts/1
  # PATCH/PUT /ajax_posts/1.json
  def update
    respond_to do |format|
      if @ajax_post.update(ajax_post_params)
        format.html { redirect_to @ajax_post, notice: 'Ajax post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ajax_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ajax_posts/1
  # DELETE /ajax_posts/1.json
  def destroy
    @ajax_post.destroy
    respond_to do |format|
      format.html { redirect_to ajax_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ajax_post
      @ajax_post = AjaxPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ajax_post_params
      params.require(:ajax_post).permit(:user_id, :status)
    end
end
