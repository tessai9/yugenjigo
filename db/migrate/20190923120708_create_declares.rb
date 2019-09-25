class CreateDeclares < ActiveRecord::Migration[5.2]
  def change
    create_table :declares do |t|
      t.string :uid
      t.text :declare
      t.boolean :done, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
