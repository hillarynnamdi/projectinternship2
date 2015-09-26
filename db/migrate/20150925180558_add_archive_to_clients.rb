class AddArchiveToClients < ActiveRecord::Migration
  def change
    add_column :clients, :archived, :boolean,:default=>false
  end
end
