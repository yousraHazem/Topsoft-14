class CommentsController < ApplicationController
#Here we create our comment
#Parameters : None
#returns : None
# This method checks if the user is not a supervisor to be allowed to create a 
# new comment.
#Author : Abdelrahman Saad, Shary Beshara 
  def create
  	if ! Supervisor.exists?(registered_user: current_user)
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.create!(comment_params)
    	redirect_to @post
    end
  end
#Here we define the parameters of the comment
#Parameters : None
#returns : None
#Author : Abdelrahman Saad
  def comment_params
    params.require(:comment).permit(:body , :post_id)
  end
end


    