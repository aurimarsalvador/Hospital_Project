class AddValorAPrazoToCompras < ActiveRecord::Migration[7.1]
  def change
    add_column :compras, :valor_a_prazo, :decimal
  end
end
