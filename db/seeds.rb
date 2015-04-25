u1 = User.create(email: "user1@user.pl", password: "useruser1", firstname: "Jan", lastname: "Kowalski")
u2 = User.create(email: "user2@user.pl", password: "useruser2", firstname: "Jan", lastname: "Kowalski")
u3 = User.create(email: "user3@user.pl", password: "useruser3", firstname: "Jan", lastname: "Kowalski")


users = [u1, u2, u3]

1.upto 10 do |i|
  user1 = users.sample
  user2 = users.sample
  Task.create(name: "task #{i}", desc: "task #{i} description", status: "failed!",
              author: user1, owner: user2)
end