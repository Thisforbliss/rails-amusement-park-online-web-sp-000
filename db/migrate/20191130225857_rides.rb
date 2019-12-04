class Rides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.references :attraction, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamp
    end
  end
end
