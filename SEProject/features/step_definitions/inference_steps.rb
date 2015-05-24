Given /^"Emergency([0-9]+)" has contributor "User([0-9]+)"$/ do |emId,uId|
	Donation.create({:user => User.where('id = ?',uId.to_i).first, :emergency => Emergency.where('id = ?',emId.to_i).first, :amount_donated => Faker::Number.between(10,1000)})
end
Given /^"User([0-9]+)" has contributed to "Emergency([0-9]+)"$/ do |uId,emId|
	Donation.create({:user => User.where('id = ?',uId.to_i).first, :emergency => Emergency.where('id = ?',emId.to_i).first, :amount_donated => Faker::Number.between(10,1000)})
end
When /^I follow the user with id "([0-9]+)"$/ do |uId|
	name = User.where('id = ?',1).first.username
	step "I follow \"#{name}\""
end
Then /^I should see user with id "([0-9]+)"$/ do |uId|
	name = User.where('id = ?',1).first.username
	step "I should see \"#{name}\""
end

