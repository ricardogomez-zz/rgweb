class EditarController < ApplicationController
  before_filter :login_required
  
  
  def renombra
  	rename('para_leer', 'paraviajar')
  	rename('textos', 'paraleer')
  	rename('libros', 'mislibros')
  	render :text => 'recuerda cambiar las principales!'
  end
  
  
  def index
    lista
    render :action => 'lista'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :lista }

  def lista
    @pages = Page.find_all_by_section(params[:section], :order => 'position')
  end

  def new
    @page = Page.new(:section => params[:section])
  end

  def create
    @page = Page.new(params[:page])
    @page.attachments << main_attachment(params) if has_attachment(params)
    if @page.save	
      flash[:notice] = 'Página creada'
      redirect_to :action => 'edit', :id => @page.id
	    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    page = Page.find(params[:id])
    page.attributes = params[:page]
		page.attachments << main_attachment(params) if has_attachment(params)
			
		save_and_edit page
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    redirect_to :action => 'lista', :section => page.section
  end
  
  def reorder
  	section = params[:section]
	@items = Page.find(:all, :conditions => ["section = ?", section], :order => "position")
	@items.each_with_index do |item, index| 
		item.update_attribute(:position, "%03d" % (index + 1))
		item.save
	end
	redirect_to :action => 'lista', :section => section
  end
  
  def add_attachment
  	page = Page.find(params[:id])
  	attachment = Attachment.new(:uploaded_data => params[:data], :tags => Page::IMAGE_TAGS[:extra])
  	page.attachments << attachment
  	
  	save_and_edit page
  end
  
 private
 
   def rename(oldname, newname)
  	pages = Page.find_all_by_section(oldname)
  	pages.each {|p| p.update_attribute(:section, newname)}
  end
 
 	def save_and_edit(page)
		if page.save
      flash[:notice] = 'Página guardada'
    else
    	flash[:notice] = 'No se ha podido guardar!!!! aaargggggg'
    end
      redirect_to :action => 'edit', :id => page.id 	
 	end
 
 	def has_attachment(params)
 		!params[:main_data].nil? && params[:main_data].length > 0
 	end
 	
 	def main_attachment(params)
 		Attachment.new(:uploaded_data => params[:main_data], :tags => Page::IMAGE_TAGS[:main])
 	end
end
