Given (/^I am logged in as a (.*)$/) do |type|
    step "I am on the login page"
	User.create(:username => 'user1', :password => 'pass1', :user_type => '{#type}')
	fill_in('Username', :with => 'user1')
	fill_in('Password', :with => 'pass1')
	click_button ('Log in')
end

When (/^My location is (.*)$/) do |ip|
	env['HTTP_X_REAL_IP'] = ip
end 