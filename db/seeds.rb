# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Text.create([
  { title: 'アナと雪の女' },
  { title: '神学経典' },
  { title: 'ハンムラビ法典' }
])

AnswerSheet.create([
  { description: "解答用紙0115" , text_id: 1},
  { description: "解答用紙0215" , text_id: 1},
  { description: "解答用紙x" , text_id: 3},
])
