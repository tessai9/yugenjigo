class RemoveUidFromDeclares < ActiveRecord::Migration[5.2]
  def change
    remove_column :declares, :uid, :string
  end
end
