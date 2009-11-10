module EditarHelper

	def options_for(page)
		options = ''
		Page::OPTIONS.each {|o| options += page.extra == o ? "<option selected=\"selected\">#{o}</option>" : "<option>#{o}</option>"}
		options		
	end
	
end
