class AddProdutoToVendaItem < ActiveRecord::Migration[7.1]
  def change
    add_reference :venda_itens, :produto, null: false, foreign_key: true
  end
end
