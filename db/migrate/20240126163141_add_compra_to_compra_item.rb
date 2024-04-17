class AddCompraToCompraItem < ActiveRecord::Migration[7.1]
  def change
    add_reference :compra_itens, :compra, null: false, foreign_key: true
  end
end
