# create default user
#User.create!(name: "firmo holanda", email: "firmo@viize.com")

#4.times do |n|
#  name = Faker::Name.name
#  email = "example-#{n+1}@example.com"
#  User.create!(name: name, email: email)
#end

# create groups
users = User.take(5)
users.each do |user|
  2.times do |n|
    name = Faker::Lorem.words(rand(1..10)).join(" ")
    user_id = user.id

    Group.create!(name: name, user_id: user_id)
  end
end

# create projects
groups = Group.take(10)
users.each do |user|
  2.times do |n|
    name = Faker::Lorem.words(rand(1..10)).join(" ")
    hours = rand(1..100)
    author_id = user.id
    groups.each do |group|
      project[group_ids] = rand(group.id)
    end

    Project.create!(name: name, hours: hours, author_id: author_id, group_ids: group_ids)
  end
end