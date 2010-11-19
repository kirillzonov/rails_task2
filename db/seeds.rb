Post.delete_all
Category.delete_all

(1..5).to_a.each do |index|
    category = Category.create(:name => 'category_' + index.to_s)

      (1..10).to_a.each do |post_index|
            category.posts.create(
                  :theme => "some_theme #{rand(100)}",
                  :source => 'some_source',
                  :tags => "tag" * rand(10),
                  :content => "Some news in category  #{category.name} and about #{post_index}" * 8,
                  :rate => rand(20) - 10
                )
                  end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
