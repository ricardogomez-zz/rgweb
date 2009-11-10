class GenerateSectionMainPages < ActiveRecord::Migration
  def self.up
    ApplicationController::SECTIONS.each do |section|
      page = Page.find_by_name(section)
      page.update_attribute(:title, section) if page.title.nil?
      Page.create!(:name => section, :section => section) if page.nil?
    end
  end

  def self.down
  end
end
