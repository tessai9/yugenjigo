class AddDefaultToReferer < ActiveRecord::Migration[5.2]
  def change
    change_column_default :declares, :done, false
  end
end
