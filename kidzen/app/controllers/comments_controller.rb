class CommentsController < ApplicationController
#Here we create our comment
#Parameters : None
#returns : None
#Author : Abdelrahman Saad
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    redirect_to @post
  end
#Here we define the parameters of the comment
#Parameters : None
#returns : None
#Author : Abdelrahman Saad
  def comment_params
    params.require(:comment).permit(:body , :post_id)
  end
end
