class PageEndAndExtra < ActiveRecord::Migration
  def self.up
		add_column :pages, 'end', :string, {:limit => 4096}
		add_column :pages, 'extra', :string
		add_column :pages, 'params', :string
		add_column :pages, 'position', :string
		add_column :pages, 'created_on', :timestamp
		add_column :pages, 'updated_on', :timestamp
  end

  def self.down
		remove_column :pages, 'end'  
		remove_column :pages, 'extra'  
		remove_column :pages, 'params'  
		remove_column :pages, 'position'  
		remove_column :pages, 'created_on'  
		remove_column :pages, 'updated_on'
  end
end
