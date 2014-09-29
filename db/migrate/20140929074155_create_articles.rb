class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.string :location
      t.text :body
      t.datetime :published_at

      t.timestamps
    end
  end
end
