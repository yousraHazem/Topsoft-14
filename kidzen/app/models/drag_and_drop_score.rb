class DragAndDropScore < ActiveRecord::Base
	belongs_to :drag_and_drop, foreign_key: 'drag_and_drop_id'  
end
