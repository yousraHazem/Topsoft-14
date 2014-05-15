# controller for Puzzles
# Author : Moaz El-Nashar
class PuzzlesController < ApplicationController
  before_action :set_puzzle, only: [:show, :edit, :update, :destroy]

  # List all puzzles from the database
  # Return non   
  # Complexity O(n)
  # Author : Moaz El-Nashar
  def index
    @puzzles = Puzzle.all
  end

  # Display Puzzle and its score
  # Return non   
  # Complexity O(1) for the puzzle it self and O(n) for the score
  # Author : Moaz El-Nashar
  def show
    @puzzle_score = PuzzleScore.all
  end

  # Create new puzzle
  # Return non 
  # Complexity O(1)
  # Author : Moaz El-Nashar
  def new
    @puzzle = Puzzle.new
  end

  # Edit existing puzzle 
  # Return non 
  # Complexity O(1)
  # Author : Moaz El-Nashar
  def edit
  end

  # Create new puzzle 
  # Return : redirect to the show page or the new page  
  # Complexity O(1)
  # Author : Moaz El-Nashar
  def create
    @puzzle = Puzzle.new(puzzle_params)
    if @puzzle.save
      flash[:notice] = "Successfully added photo."
      redirect_to @puzzle
    else
      render :action => 'new'
    end
  end

  # Update an existing puzzle
  # Return : redirect to the show or edit page
  # Complexity O(1)
  # Author : Moaz El-Nashar  
  def update
    respond_to do |format|
      if @puzzle.update(puzzle_params)
        format.html { redirect_to @puzzle, notice: 'Puzzle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @puzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroy an existing puzzle
  # Return : Redirect to index page
  # complexity O(1)
  # Author : Moaz El-Nashar  
  def destroy
    @puzzle.destroy
    respond_to do |format|
      format.html { redirect_to puzzles_url }
      format.json { head :no_content }
    end
  end

  private
    # Finding puzzle by id
    # complexity O(n)
    # Author : Moaz El-Nashar
    def set_puzzle
      @puzzle = Puzzle.find(params[:id])
    end

    # Define attributes for Rails 4
    # complexity O(n)
    # Author : Moaz El-Nashar
    def puzzle_params
      params.require(:puzzle).permit(:description, :image, :remote_image_url)
    end
end
