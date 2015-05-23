class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :activation_code, null: false
      t.string :question
      t.string :answer
      t.boolean :active, default: false, null: false

      t.timestamps null: false
    end
  end
end
