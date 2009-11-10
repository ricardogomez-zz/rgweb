class Attachment < ActiveRecord::Base
	has_attachment :content_type => :image, 
		:storage => :file_system, :thumbnails => { :thumb => 'x170' }
	validates_as_attachment
end
