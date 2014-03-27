class Message < ActiveRecord::Base
	attr_accessible :title,:sender,:receiver,:content
	

end
