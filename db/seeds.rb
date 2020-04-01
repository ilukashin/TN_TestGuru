# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
                  { title: 'Ruby' },
                  { title: 'DevOps' },
                  { title: 'HTML' }
                ])
Test.create([
              { title: 'Ruby basics', level: 1, category_id: 1 },
              { title: 'Ruby improved', level: 2, category_id: 1 },
              { title: 'CI/CD', level: 2, category_id: 2 },
              { title: 'Containerization software', level: 3, category_id: 2 },
              { title: 'HTML/CSS', level: 1, category_id: 3 }
            ])
Question.create([
                  { body: 'How to include module in class?', test_id: 1 },
                  { body: 'How to forward ports from docker containers?', test_id: 4 },
                  { body: 'Test question1', test_id: 2 },
                  { body: 'Another test question', test_id: 3 }
                ])
Answer.create([
                { body: 'Some data1', correct: true, question_id: 1 },
                { body: 'Some data2', correct: false, question_id: 1 },
                { body: 'Some data3', correct: true, question_id: 2 },
                { body: 'Some data4', correct: false, question_id: 2 },
                { body: 'Some data5', correct: false, question_id: 2 }
              ])
User.create([
              { name: 'admin', email: 'admin@example.com' },
              { name: 'customer', email: 'customer@example.com' }
            ])
