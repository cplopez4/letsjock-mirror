class CreateRecognitions < ActiveRecord::Migration
  def change
    create_table :recognitions do |t|
      t.integer :user_id
      t.integer :sport_id
      t.integer :competition_id
      t.integer :team_id
      t.integer :work_id
      t.string :awarded_by
      t.string :description
      t.date :date
      t.boolean :as_athlete

      t.timestamps
    end
  end
end
