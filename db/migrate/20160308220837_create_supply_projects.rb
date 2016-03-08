class CreateSupplyProjects < ActiveRecord::Migration
  def change
  	create_table :supply_projects do |t|
  		t.integer :supply_id
  		t.integer :project_id
  	end
  end
end
