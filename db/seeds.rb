# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([
                  { title: 'Ruby' },
                  { title: 'DevOps' },
                  { title: 'HTML' }
                ])

tests = Test.create!([
              { title: 'Ruby basics', level: 1, category_id: categories[0].id },
              { title: 'Ruby improved', level: 2, category_id: categories[0].id },
              { title: 'CI/CD', level: 2, category_id: categories[1].id },
              { title: 'Containerization software', level: 3, category_id: categories[1].id },
              { title: 'HTML/CSS', level: 1, category_id: categories[2].id }
            ])

questions = Question.create!([
                  { body: 'How to include module in class?', test_id: tests[0].id },
                  { body: 'How to forward ports from docker containers?', test_id: tests[3].id },
                  { body: 'Test question1', test_id: tests[1].id },
                  { body: 'Another test question', test_id: tests[2].id }
                ])

Answer.create!([
                { body: 'Some data1', correct: true, question_id: questions[0].id },
                { body: 'Some data2', correct: false, question_id: questions[0].id },
                { body: 'Some data3', correct: true, question_id: questions[1].id },
                { body: 'Some data4', correct: false, question_id: questions[2].id },
                { body: 'Some data5', correct: false, question_id: questions[2].id }
              ])

users = User.create!([
              { name: 'admin', email: 'admin@example.com' },
              { name: 'customer', email: 'customer@example.com' }
            ])

tests.each { |test| test.update(author_id: user[0].id) }            

TESTS_USERS_RELATIONS = "INSERT into tests_users VALUES
  (#{tests[0].id}, #{users[0].id}),
  (#{tests[2].id}, #{users[0].id}),
  (#{tests[4].id}, #{users[0].id}),
  (#{tests[1].id}, #{users[1].id}),
  (#{tests[3].id}, #{users[1].id});"
ActiveRecord::Base.connection.execute(TESTS_USERS_RELATIONS)
