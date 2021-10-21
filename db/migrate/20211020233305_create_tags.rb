class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false, comment: "名前"
      t.timestamps
      t.index :name, unique: true
    end
  end
end
