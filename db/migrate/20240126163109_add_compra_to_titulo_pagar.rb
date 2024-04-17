class AddCompraToTituloPagar < ActiveRecord::Migration[7.1]
  def change
    add_reference :titulos_pagar, :compra, null: false, foreign_key: true
  end
end
