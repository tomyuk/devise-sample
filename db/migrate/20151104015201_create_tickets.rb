class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :admin, index: true, foreign_key: true
      t.string :subject
      t.text :message
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
