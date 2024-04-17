class AddValorTotalToCompras < ActiveRecord::Migration[7.1]
  def change
    add_column :compras, :valor_total, :decimal
  end
end
