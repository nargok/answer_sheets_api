class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.belongs_to :answer_sheet
      t.integer :answer_no
      t.string :answer
      t.references :answer_type
      t.timestamps
    end
  end
end
