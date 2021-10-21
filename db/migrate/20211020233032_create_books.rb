class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false, comment: "タイトル"
      t.text :description, null: false, comment: "詳細"
      t.datetime :released_at, null: true, comment: "発売日"
      t.integer :price, null: false, default: 0, comment: "価格"
      t.integer :status, null: false, default: 0, comment: "ステータス"
      t.timestamps
      #
      t.index :title
      t.index :status
    end
  end
end
