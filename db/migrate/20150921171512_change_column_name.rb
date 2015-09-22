class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :clients, :sex, :gender
  end
end
