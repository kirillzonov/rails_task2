Given /^a post with id = (\d+) exists$/ do |id|
  if Post.count.zero? 
    Category.create!(:name => 'category')
    Category.first.posts.create!(:theme => 'theme', :content => 'content', :source => '', :tags => '')
  end
    puts Post.first.theme
end

Given /^I haven't voted before$/ do
  if !Vote.where(:user_ip => '127.0.0.1', :post_id => 1).count.zero?
    return
  end
end

Given /^I know rate for the post (\d+)$/ do |id|
  @current_post_rate = Post.find(id).rate
  puts Post.find(id).rate
end

Then /^I want know now rate for post (\d+)$/ do |id|
  puts Post.find(id).rate
end

When /^I voteup for post with id = (\d+)$/ do |id|
  Post.find(id).change_rate(1)
end
