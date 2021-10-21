class CreateRlBookAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :rl_book_authors do |t|
      t.references :book, null: false, index: true, comment: "書籍ID"
      t.references :author, null: false, index: true, comment: "著者ID"
      t.integer :sort_key, null: false, default: 0, comment: "順番指定キー"
      t.timestamps
      t.index [:book_id, :author_id], unique: true
      t.index :sort_key
    end
  end
end
