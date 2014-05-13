class DragAndDropsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:update]
  protect_from_forgery with: :null_session
  require 'json'

  # This method is used to Allow accessing model attributes As Rails 4 does
  # not support "attr_accessible" keyword.
  # Parameters : None.
  # Returns : None.
  # Approach : The method is  just making The model's column accessible.
  # Author : Hussien M. Eloy.
  def drag_and_drop_params
    params.require(:drag_and_drop).permit(:name, :image)
  end

  # This method used to initialize new Drag and Drop Game 
  # and assign it to variable @drag_and_drop in order to access it in new view.
  # Parameters : None.
  # Returns : None.
  # Approach : Just creates new Instance of Game.
  # Author : Hussien M. Eloy.
  def new
    @drag_and_drop = DragAndDrop.new
  end

  # This method used to assign game using it's id
  # to variable @drag_and_drop in order to view it.
  # as well as selecting the scores that corresponds ti this game and view the
  # latest 10 of them in the show view.
  # Parameters : None.
  # Returns : None.
  # Approach : Select game record using it's id.
  # Author : Hussien M. Eloy.
  def show
    @drag_and_drop = DragAndDrop.find(params[:id])
    @drag_and_drops_scores = DragAndDropScore
      .order("created_at desc").limit(10)
        .where(:drag_and_drop_id => @drag_and_drop[:id])
  end

  # This method used to initialize new game using its parameters
  # and assign it to variable @drag_and_drop and trying to save it
  # in order to access it in form view to create.
  # Parameters : None.
  # Returns : None.
  # Approach : Just creates new Instance of game.
  # Author : Hussien M. Eloy.
  def create
    @drag_and_drop = DragAndDrop.new(drag_and_drop_params)
    if @drag_and_drop.save
      flash[:notice] = "Successfully created drag & drop game."
      redirect_to @drag_and_drop
    else
      render :action => 'new'
    end
  end

  # This method is used to recieve AJAX requests that come from the javascript
  # files. In order to use these data for insertion in database in table Posts 
  # or table DragAndDropScores.
  # Parameters : None.
  # Returns : None.
  # Approach : This method waits for the AJAX request that 
  # came from client side, if the user wants to share score, It will wait for
  # PUT request that hold title and content of the sharing post 
  # and save it later, If it happens at the end of the game it will recieve new
  # PUT request that holds the score of the played game and the id of this game
  # , then it should store them in DragAndDropScores table 
  # in order to keep track of score of this turn when playing again. 
  # Author : Hussien M. Eloy.
  def update
    post_title = params[:title]
    post_content = params[:body]
    @post = Post.new(:title => post_title, :body => post_content)
    @post.save
    new_score =  params[:score]
    @drag_and_drops_score = DragAndDropScore.new(:drag_and_drop_id => params[:id], 
      :score => new_score)
    @drag_and_drops_score.save
  end
end
