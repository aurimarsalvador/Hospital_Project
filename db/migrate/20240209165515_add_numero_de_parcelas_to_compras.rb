class AddNumeroDeParcelasToCompras < ActiveRecord::Migration[7.1]
  def change
    add_column :compras, :numero_de_parcelas, :integer
  end
end
