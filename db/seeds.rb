business_list = {
	"Business 1 " => { 
		:name => "Test Web Dev Business", 
		:username => "web", 
		:password => "1"
		},
	"Business 2" => { 
		:name => "Test Design Business", 
		:username => "design", 
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
		:name => "Make a website",
		:business_id => 1
		},
	"Project 2" => { 
		:name => "Do something really cool in no time",
		:business_id => 2
	}
}

projects_list.each do |project, hash|
	Project.create(hash)
end

b1 = Business.all.first
b2 = Business.all.last

p1 = b1.projects.first
p2 = b2.projects.first

p1.employees << b1.employees.first
p1.supplies << b1.supplies.first
p1.save

p2.employees << b2.employees.first
p2.supplies << b2.supplies.first
p2.save