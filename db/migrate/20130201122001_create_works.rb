class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :user_id
      t.integer :sport_id
      t.string :company
      t.string :role
      t.integer :country_id
      t.string :location
      t.date :init
      t.date :end

      t.timestamps
    end
  end
end
