class CreateSupplies < ActiveRecord::Migration
  def change
  	create_table :supplies do |t|
  		t.string :name
  		t.integer :business_id
  	end
  end
end
