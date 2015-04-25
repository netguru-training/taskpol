User.destroy_all
Status.destroy_all
Task.destroy_all

u1 = User.create(email: "user1@user.pl", password: "useruser1", firstname: "Jan", lastname: "Kowalski")
u2 = User.create(email: "user2@user.pl", password: "useruser2", firstname: "Jan", lastname: "Kowalski")
u3 = User.create(email: "user3@user.pl", password: "useruser3", firstname: "Jan", lastname: "Kowalski")

s1 = Status.create(name: 'ToDo')
s2 = Status.create(name: 'In progress')
s3 = Status.create(name: 'Testing')
s4 = Status.create(name: 'Done')

users = [u1, u2, u3]
statuses = [s1, s2, s3, s4]

1.upto 10 do |i|
  user1 = users.sample
  user2 = users.sample
  status = statuses.sample
  Task.create(name: "task #{i}", desc: "task #{i} description", status: status,
              author: user1, owner: user2)
end