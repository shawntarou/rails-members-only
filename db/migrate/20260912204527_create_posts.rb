class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title, null: false, default: 'Default Title'
      t.text :body, null: false, default: 'Default Body'

      t.timestamps
    end
  end
end
