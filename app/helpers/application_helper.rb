# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  	def section_for(name)
		name = name.to_s
		link_to "<h2>#{name}</h2>", {:controller => 'ver', :action => 'show',  :section => name}, {:class => 'item' }
	end

	def default_url(name)
		"ver/#{name}"
	end

	def current_section
		params[:section]
	end

	def beautify(text)
	    text = text.gsub('---', 'p(separa). separa')
		RedCloth.new(text).to_html unless text.nil?
	end
end
