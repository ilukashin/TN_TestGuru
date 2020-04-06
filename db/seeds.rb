# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { name: 'admin', email: 'admin@example.com' },
                       { name: 'customer', email: 'customer@example.com' }
                     ])

categories = Category.create!([
                                { title: 'Ruby' },
                                { title: 'DevOps' },
                                { title: 'HTML' }
                              ])

tests = Test.create!([
                       { title: 'Ruby basics', level: 1, category: categories[0], author: users[0] },
                       { title: 'Ruby improved', level: 2, category: categories[0], author: users[0] },
                       { title: 'CI/CD', level: 2, category: categories[1], author: users[0] },
                       { title: 'Containerization software', level: 3, category: categories[1], author: users[0] },
                       { title: 'HTML/CSS', level: 1, category: categories[2], author: users[1] }
                     ])

questions = Question.create!([
                               { body: 'How to include module in class?', test: tests[0] },
                               { body: 'How to forward ports from docker containers?', test: tests[3] },
                               { body: 'Test question1', test: tests[1] },
                               { body: 'Another test question', test: tests[2] }
                             ])

Answer.create!([
                 { body: 'Some data1', correct: true, question: questions[0] },
                 { body: 'Some data2', correct: false, question: questions[0] },
                 { body: 'Some data3', correct: true, question: questions[1] },
                 { body: 'Some data4', correct: false, question: questions[2] },
                 { body: 'Some data5', correct: false, question: questions[2] }
               ])

TESTS_USERS_RELATIONS = "INSERT into tests_users VALUES
  (#{tests[0].id}, #{users[0].id}),
  (#{tests[2].id}, #{users[0].id}),
  (#{tests[4].id}, #{users[0].id}),
  (#{tests[1].id}, #{users[1].id}),
  (#{tests[3].id}, #{users[1].id});"
ActiveRecord::Base.connection.execute(TESTS_USERS_RELATIONS)
