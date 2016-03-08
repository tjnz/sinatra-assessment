class CreateEmployeeProjects < ActiveRecord::Migration
  def change
  	create_table :employee_projects do |t|
  		t.integer :project_id
  		t.integer :employee_id
  	end
  end
end
