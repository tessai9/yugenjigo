class CreateDeclares < ActiveRecord::Migration[5.2]
  def change
    create_table :declares do |t|
      t.string :uid
      t.text :declare
      t.boolean :done

      t.timestamps
    end
  end
end
