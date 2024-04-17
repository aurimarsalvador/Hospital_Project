class AddValorAVistaToCompras < ActiveRecord::Migration[7.1]
  def change
    add_column :compras, :valor_a_vista, :decimal
  end
end
