User.destroy_all
Status.destroy_all
Task.destroy_all
Project.destroy_all

u1 = User.create(email: "user1@user.pl", password: "useruser1", firstname: "Jan", lastname: "Kowalski")
u2 = User.create(email: "user2@user.pl", password: "useruser2", firstname: "Ala", lastname: "Nowak")
u3 = User.create(email: "user3@user.pl", password: "useruser3", firstname: "Mateusz", lastname: "Xyz")

s1 = Status.create(name: 'ToDo')
s2 = Status.create(name: 'In progress')
s3 = Status.create(name: 'Testing')
s4 = Status.create(name: 'Done')

users = [u1, u2, u3]
statuses = [s1, s2, s3, s4]

project = Project.create(title: "Zastosowanie łańuchów Markowa ...", desc: "No tak opis...", author_id: u1.id)
project2 = Project.create(title: "WTF?! ...", desc: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo, excepturi, consequatur architecto cumque ut dolorum aut voluptatem sit deserunt!", author_id: u1.id)

1.upto 10 do |i|
  user1 = users.sample
  user2 = users.sample
  status = statuses.sample
  task = Task.create(
    name: "task #{i}",
    markdown_desc: "``` alert('task #{i}');``` ````console.log(nie dziala);```",
    status: status,
    author: user1,
    owner: user2,
  )

  project.tasks << task
end
