class RemoveIndex < ActiveRecord::Migration
  def self.up
       remove_index :pages, :name
  end

  def self.down
  end
end
