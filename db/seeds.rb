user = User.new
user.email = 'user@exemple.com'
user.password = 'password'
user.password_confirmation = 'password'
user.save!

Project.create!([
  {name: "Complete the test task for RubyGarage", user_id: 1},
  {name: "New Project", user_id: 2},
  {name: "New Project", user_id: 2},
  {name: "New Project", user_id: 2},
  {name: "New Project", user_id: 2}
])
Task.create!([
  {name: "Open mockup", status: nil, project_id: 1},
  {name: "Attentively check the file", status: nil, project_id: 1},
  {name: "Write HTML & CSS", status: nil, project_id: 1},
  {name: "Add Javascript", status: nil, project_id: 1}
])
