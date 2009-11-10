class MoveParaViajarToWebsAmigas < ActiveRecord::Migration
  def self.up
    Page.all(:conditions => {:section => 'paraviajar'}).each do |p|
      p.update_attribute(:section, 'websamigas')
    end
    Page.first(:conditions => {:name => 'paraviajar'}).update_attribute(:name, 'websamigas')
  end

  def self.down
    Page.all(:conditions => {:section => 'websamigas'}).each do |p|
      p.update_attribute(:section, 'paraviajar')
    end
    Page.first(:conditions => {:name => 'websamigas'}).update_attribute(:name, 'paraviajar')
  end
end
