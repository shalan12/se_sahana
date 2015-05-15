Given (^I am logged in as (.*)$/) do |type|
	User.create(:username => 'user1', :password => 'pass1', :type => '{#type}')
	fill_in('username', :with => 'user1')
	fill_in('password', :with => 'pass1')
	click('login')
end

Given(^My location is (.*)$/) do |ip|
	env['HTTP_X_REAL_IP'] = ip
end