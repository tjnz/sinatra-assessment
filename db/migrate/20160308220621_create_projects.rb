class CreateProjects < ActiveRecord::Migration
  def change
  	create_table :projects do |t|
  		t.string :name
  		t.integer :business_id
  	end
  end
end
