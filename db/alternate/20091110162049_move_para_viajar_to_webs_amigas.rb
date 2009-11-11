class MoveParaViajarToWebsAmigas < ActiveRecord::Migration
  def self.up
    Page.all(:conditions => {:section => 'paraviajar'}).each do |p|
      p.update_attribute(:section, 'websamigas')
    end
    principal = Page.find_by_name('paraviajar')
    principal.update_attribute(:name, 'websamigas') if principal
  end

  def self.down
    Page.all(:conditions => {:section => 'websamigas'}).each do |p|
      p.update_attribute(:section, 'paraviajar')
    end
    Page.first(:conditions => {:name => 'websamigas'}).update_attribute(:name, 'paraviajar')
  end
end
