class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :ticket, index: true, foreign_key: true
      t.string :type
      t.text :body

      t.timestamps null: false
    end
  end
end
