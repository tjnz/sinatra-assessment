business_list = {
	"Business 1 " => { 
		:name => "Test Business 1", 
		:username => "test", 
		:password => "1"
		},
	"Business 2" => { 
		:name => "Test Business 2", 
		:username => "test", 
		:password => "1"
	}
}

business_list.each do |business, hash|
	Business.create(hash)
end


employee_list = {
	"Employee 1 " => { 
		:name => "Test Employee 1",
		:business_id => 1
		},
	"Employee 2" => { 
		:name => "Test Employee 2",
		:business_id => 2
	}
}

employee_list.each do |employee, hash|
	Employee.create(hash)
end

supplies_list = {
	"Supply 1 " => { 
		:name => "Mac Book Pro",
		:business_id => 1
		},
	"Supply 2" => { 
		:name => "Lots of Pizza", 
		:business_id => 2
	}
}

supplies_list.each do |supply, hash|
	Supply.create(hash)
end

projects_list = {
	"Project 1 " => { 
		:name => "Empty Project 1",
		:business_id => 1
		},
	"Project 2" => { 
		:name => "Empty Project 2",
		:business_id => 2
	}
}

projects_list.each do |project, hash|
	Project.create(hash)
end