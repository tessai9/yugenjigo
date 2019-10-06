class AddCheeredToDeclares < ActiveRecord::Migration[5.2]
  def change
    add_column :declares, :cheered, :smallint, default: 0
  end
end
