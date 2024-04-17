class AddVendaToVendaItem < ActiveRecord::Migration[7.1]
  def change
    add_reference :venda_itens, :venda, null: false, foreign_key: true
  end
end
