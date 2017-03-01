class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :name
      t.attachment :file

      t.timestamps
    end
    
    add_index :images, :name, unique: true
  end
end
