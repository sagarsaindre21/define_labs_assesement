class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.integer :user_id, add_index: :true

      t.timestamps
    end
  end
end
