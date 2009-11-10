class AttachmentsController < ApplicationController

	def delete_image
		Attachment.find(params[:id]).destroy
    flash[:notice] = 'Imágen borrada!!'	
		redirect_to :controller => 'editar', :action => 'edit', :id => params[:page]
	end
	
end
