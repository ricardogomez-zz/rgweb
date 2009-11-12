# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def section_for(name)
		name = name.to_s
		link_to "<h2>#{name}</h2>", section_url(name), {:class => 'item' }
	end

  def section_url(name, current = nil)
    name == current ? '#' : {:controller => 'ver', :action => 'show',  :section => name}
  end

	def default_url(name)
		"ver/#{name}"
	end

	def current_section
		params[:section]
	end

	def beautify(text)
    if !text.blank?
      text = text.gsub('---', 'p(separa). separa')
      RedCloth.new(text).to_html unless text.nil?
    else
      ''
    end
	end
end
