class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.integer :category_id

      t.timestamps
    end

    add_index :articles, :slug, unique: true
  end
end
