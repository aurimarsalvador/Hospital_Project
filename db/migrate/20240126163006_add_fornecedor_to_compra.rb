class AddFornecedorToCompra < ActiveRecord::Migration[7.1]
  def change
    add_reference :compras, :fornecedor, null: false, foreign_key: true
  end
end
