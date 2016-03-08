This app will let you create a simple business, with projects that you can apply employees to and inventory


Business
Has many projects
Has many employees
Has many supplies

Project
Belongs to Business
Has many employees
Has many supplies

Employee
Belongs to business
Has many projects

Supply
Belongs to business
Has many projects

Business < logs you in
Name, username, password

Employee
Name

Supply
Name, count

Project 
Name, employees, supplies
