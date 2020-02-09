class AddColumnsToTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :texts, :publisher, :string
    add_column :texts, :published_date, :date
    add_column :texts, :image_url, :string
  end
end
