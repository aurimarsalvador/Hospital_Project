class AddDiasIntervaloToCompras < ActiveRecord::Migration[7.1]
  def change
    add_column :compras, :dias_intervalo, :integer
  end
end
