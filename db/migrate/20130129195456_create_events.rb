class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.datetime :date
      t.string :description
      t.string :name
      t.string :place
      t.string :imageurl


      t.timestamps
    end
  end
end
