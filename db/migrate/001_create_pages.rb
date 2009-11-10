class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
    	t.column "name", :string
      	t.column "title", :string
      	t.column "section", :string
      	t.column "head", :string, {:limit => 1024}
      	t.column "content", :string, {:limit => 8192}
    end
  end

  def self.down
    drop_table :pages
  end
end
