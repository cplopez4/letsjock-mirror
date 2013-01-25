class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.string :gender
      t.datetime :birth
      t.string :citybirth
      t.string :country
      t.integer :phone
      t.string :resume
      t.integer :height
      t.integer :weight
      t.string :remember_token

      t.timestamps
    end
    add_index  :users, :remember_token
  end
end
