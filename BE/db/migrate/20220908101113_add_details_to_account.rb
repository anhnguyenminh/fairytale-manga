class AddDetailsToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :account, :address , :text
    add_column :account, :vat_rate, :float
    add_column :account, :tax_payer_id, :string
    add_column :account, :default_currency, :string
  end
end
