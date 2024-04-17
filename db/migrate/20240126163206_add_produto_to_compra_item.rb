class AddProdutoToCompraItem < ActiveRecord::Migration[7.1]
  def change
    add_reference :compra_itens, :produto, null: false, foreign_key: true
  end
end
