Then /show page/ do
  puts body
end
Then /^user "([^""]*)" is exist$/ do |email|
  if !User.find_by_email(email).nil?
    puts 'User successefuly created'
  else
    puts 'error'
  end
end
