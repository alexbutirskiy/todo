user = User.new
user.email = 'user@example.com'
user.password = 'password'
user.password_confirmation = 'password'
user.save!

Project.create!([
  {name: "Complete the test task for RubyGarage", user_id: 1},
  {name: "For Home", user_id: 1},
])
Task.create!([
  {name: "Open mockup", status: nil, project_id: 1},
  {name: "Attentively check the file", status: nil, project_id: 1},
  {name: "Write HTML & CSS", status: nil, project_id: 1},
  {name: "Add Javascript", status: nil, project_id: 1}
])
Task.create!([
  {name: "Buy milk", status: nil, project_id: 2},
  {name: "Call Mam", status: nil, project_id: 2},
  {name: "Clean the room", status: nil, project_id: 2},
  {name: "Repair the DVD player", status: nil, project_id: 2}
])