class Rides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.references :attractions, foreign_key: true
      t.references :users, foreign_key: true
      t.timestamp
    end
  end
end
