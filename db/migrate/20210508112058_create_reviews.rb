class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
