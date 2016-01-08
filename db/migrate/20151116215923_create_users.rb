class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :username, null: false

      t.timestamps null: false
    end

    add_index :users, :username, unique: true
    add_index :users, :name
    add_index :users, :email, unique: true


    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end

    add_index :contacts, :user_id
    add_index :contacts, :email
    add_index :contacts, [:user_id, :email], unique: true


  end
end
