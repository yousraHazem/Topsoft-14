class CommentsController < ApplicationController
#Here we create our comment
#Parameters : None
#returns : None
#Author : Abdelrahman S. Elsayed , Shary Beshara.
  def create
    if ! Supervisor.exists?(registered_user: current_user)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    respond_to do |format|
      format.html {redirect_to @post}
      format.js
    end
  end
#Here we define the parameters of the comment
#Parameters : None
#returns : None
#Author : Abdelrahman S. Elsayed
  def comment_params
    params.require(:comment).permit(:body , :post_id)
  end
end


    
