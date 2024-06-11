class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.json :initial_state, default: {}, null: false
      t.json :current_state, default: {}, null: false
      t.string :code, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
    add_index :games, :code, unique: true
  end
end
