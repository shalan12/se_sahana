Given /^My location is "([^\"].*)"$/ do |loc|
	ENV['RAILS_TEST_IP_ADDRESS'] = loc
end 