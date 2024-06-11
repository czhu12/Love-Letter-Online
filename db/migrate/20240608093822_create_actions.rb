class CreateActions < ActiveRecord::Migration[7.1]
  def change
    create_table :actions do |t|
      t.json :parameters, default: {}, null: false
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
