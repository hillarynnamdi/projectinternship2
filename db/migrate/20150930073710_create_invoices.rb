class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :item_code
      t.string :description
      t.string :qty
      t.string :unit
      t.string :total
      t.references :client, index: true

      t.timestamps
    end
  end
end
