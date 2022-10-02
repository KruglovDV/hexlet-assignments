class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :summary
      t.boolean :published

      t.timestamps
    end
  end
end
