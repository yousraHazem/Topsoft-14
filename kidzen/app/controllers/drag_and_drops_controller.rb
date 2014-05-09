class DragAndDropsController < ApplicationController

  def drag_and_drop_params
	params.require(:drag_and_drop).permit(:name, :image)
  end

  def new
  	@drag_and_drop = DragAndDrop.new
  end

  def show
  	@drag_and_drop = DragAndDrop.find(params[:id])
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
end
