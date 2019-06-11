class CreatePasswords < ActiveRecord::Migration[5.2]
  def change
    create_table :passwords do |t|
      t.string :name
      t.string :user_name
      t.string :password
      
      t.timestamps
    end
  end
end
