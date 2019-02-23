class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.references :breed, foreign_key: true
      t.string :photo
      t.integer :votes
      t.integer :total_score

      t.timestamps
    end
  end
end
