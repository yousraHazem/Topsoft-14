class DragAndDrop < ActiveRecord::Base
	mount_uploader :image , ImageUploader
	validates_presence_of :name, :image

	def drag_and_drop_params
		params.require(:drag_and_drop).permit(:name, :image)
	end
end
