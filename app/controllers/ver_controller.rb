class VerController < ApplicationController
	layout 'ver'

  after_filter {|c| c.cache_page}

	def index
    @section = 'inicio'
    #		params[:section] = 'inicio'
    #		show
    #		render :action => 'show'
    render :action => 'index', :layout => 'nada'
	end

	def show
    if params[:actualizar].present?
      expire_page
    end
		@section = params[:section]
    if 'inicio' == params[:section]
      redirect_to :action => 'index'
    else
      name = params[:page] || @section

      @page = Page.find_by_section_and_name(@section, name) || Page.new
      if @page.show_thumnails? || @page.show_list?
        @pages = Page.find_all_by_section(@section, :order => 'position')
        @subsection = ""
      end
    end
	end	
end
