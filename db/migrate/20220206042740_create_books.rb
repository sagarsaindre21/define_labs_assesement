class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :user_id, add_index: :true

      t.timestamps
    end
  end
end
