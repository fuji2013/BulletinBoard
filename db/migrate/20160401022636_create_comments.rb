class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :board, index: true, foreign_key: true
      t.string :text, null: false
      t.string :commentator, null: false
      t.timestamps null: false
    end
  end
end
