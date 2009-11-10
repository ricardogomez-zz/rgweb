class VerController < ApplicationController
	layout 'ver'
	
	def index
#		params[:section] = 'inicio'
#		show
#		render :action => 'show'
    render :action => 'index', :layout => 'nada'
	end

	def show
		section = params[:section]
		name = params[:page] || section
		@page = Page.find_by_section_and_name(section, name) || Page.new
		if @page.show_thumnails? || @page.show_list?
			@pages = Page.find_all_by_section(section, :order => 'position') 
			@subsection = ""
		end
	end	
end
