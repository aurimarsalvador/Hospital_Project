class AddVendaToTituloReceber < ActiveRecord::Migration[7.1]
  def change
    add_reference :titulos_receber, :venda, null: false, foreign_key: true
  end
end
