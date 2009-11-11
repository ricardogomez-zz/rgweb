class AddPageNameIndex < ActiveRecord::Migration
  def self.up
    add_index :pages, :name
  end

  def self.down
    remove_index :pages, :name
  end
end
