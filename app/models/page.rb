class Page < ActiveRecord::Base
	has_many :attachments, :foreign_key => :page_id

	IMAGE_TAGS = {:main => 'imágen_principal', :thum => 'miniatura', :extra => 'extra' }
	OPTIONS = ['no, no las muestres', 'si, mostrar miniaturas', 'si, mostrar lista']

	def main_image
		@image = Attachment.find_by_page_id_and_tags(id, IMAGE_TAGS[:main]) # if @image == NO_IMAGE
	end
	
	def has_main_image?
		!main_image.nil?
	end

	def section?
		section == name
	end
	
	def show_thumnails?
		section? && extra == OPTIONS[1]
	end
	
	def show_list?
		section? && extra == OPTIONS[2]
	end
	
end
