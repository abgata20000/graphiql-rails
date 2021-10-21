class CreateRlBookTags < ActiveRecord::Migration[6.1]
  def change
    create_table :rl_book_tags do |t|
      t.references :book, null: false, index: true, comment: "書籍ID"
      t.references :tag, null: false, index: true, comment: "タグID"
      t.integer :sort_key, null: false, default: 0, comment: "順番指定キー"
      t.timestamps
      t.index [:book_id, :tag_id], unique: true
      t.index :sort_key
    end
  end
end
