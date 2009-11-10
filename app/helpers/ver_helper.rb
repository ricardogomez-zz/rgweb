module VerHelper

	def main_image_of(page)
		image = page.main_image
    image.nil? ? '' : image_tag(image.public_filename)
	end

	def main_thumb_of(page) 
		image = page.main_image
    image.nil? ? '' : image_tag(image.public_filename(:thumb))
	end
end
