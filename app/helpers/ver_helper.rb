module VerHelper

	# TODO: more ruby, please
	def main_image_of(page)
		image = page.main_image
		return image_tag image.public_filename unless image.nil?
		'' if image.nil?
	end

	def main_thumb_of(page) 
		image = page.main_image
		return image_tag(image.public_filename(:thumb)) unless image.nil?
		'' if image.nil?
	end
end
