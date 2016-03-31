class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :category, index: true, foreign_key: true
      t.string :title, null: false
      t.string :owner, null: false
      t.timestamps null: false
    end
  end
end
