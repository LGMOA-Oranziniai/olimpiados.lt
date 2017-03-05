class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.integer :image_id
      t.string :url
      t.boolean :visible, null: false, default: true

      t.timestamps
    end
  end
end
