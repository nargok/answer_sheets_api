class CreateAnswerSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_sheets do |t|
      t.belongs_to :text
      t.text :description

      t.timestamps
    end
  end
end
