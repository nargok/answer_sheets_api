# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
now = Time.zone.now

Text.insert_all([
  { title: 'アナと雪の女', created_at: now, updated_at: now },
  { title: '神学経典', created_at: now, updated_at: now },
  { title: 'ハンムラビ法典', created_at: now, updated_at: now }
])

AnswerSheet.insert_all([
  { description: "解答用紙0115" , text_id: 1, created_at: now, updated_at: now },
  { description: "解答用紙0215" , text_id: 1, created_at: now, updated_at: now },
  { description: "解答用紙x" , text_id: 3, created_at: now, updated_at: now },
])

AnswerType.insert_all([
    { name: '択一:A', created_at: now, updated_at: now }
])

Answer.insert_all([
    { answer_sheet_id: AnswerSheet.first.id, answer_no: 1, answer: 'C', answer_type_id: AnswerType.first.id, created_at: now, updated_at: now },
    { answer_sheet_id: AnswerSheet.first.id, answer_no: 2, answer: 'A', answer_type_id: AnswerType.first.id, created_at: now, updated_at: now },
    { answer_sheet_id: AnswerSheet.first.id, answer_no: 3, answer: 'C', answer_type_id: AnswerType.first.id, created_at: now, updated_at: now },
])