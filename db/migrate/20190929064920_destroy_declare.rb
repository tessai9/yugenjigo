class DestroyDeclare < ActiveRecord::Migration[5.2]
  def change
    drop_table :declares
  end
end
