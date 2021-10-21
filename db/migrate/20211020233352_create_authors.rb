class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name, null: false, comment: "名前"
      t.text :description, null: false, comment: "詳細"
      t.integer :status, null: false, default: 0, comment: "ステータス"
      t.timestamps
      #
      t.index :name
      t.index :status
    end
  end
end
