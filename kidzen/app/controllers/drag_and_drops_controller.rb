class DragAndDropsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => [:update]
 protect_from_forgery with: :null_session
 require 'json'
  def drag_and_drop_params
	params.require(:drag_and_drop).permit(:name, :image)
  end

  def new
  	@drag_and_drop = DragAndDrop.new
  end

  def show
  	@drag_and_drop = DragAndDrop.find(params[:id])
  	@drag_and_drops_scores = DragAndDropScore.order("created_at desc").limit(10).where(:drag_and_drop_id => @drag_and_drop[:id])
  end

  def create
		@drag_and_drop = DragAndDrop.new(drag_and_drop_params)
		if @drag_and_drop.save
			flash[:notice] = "Successfully created drag & drop game."
			redirect_to @drag_and_drop
		else
			render :action => 'new'
		end
	end
	def update
    @post_title = params[:title]
    @post_content = params[:body]
    @post = Post.new(:title => @post_title, :body => @post_content)
    @post.save
    @new_score =  params[:score]
    @drag_and_drops_score = DragAndDropScore.new(:drag_and_drop_id => params[:id], :score => @new_score)
    @drag_and_drops_score.save
  end
  def share_score
    @post_title = params[:title]
    @post_content = params[:body]
    @post = Post.new(:title => @post_title, :body => @post_content)
    @post.save
  end
end
