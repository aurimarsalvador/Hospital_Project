class CreateVendaItens < ActiveRecord::Migration[7.1]
  def change
    create_table :venda_itens do |t|
      t.decimal :valor_unitario
      t.decimal :valor_total
      t.integer :quantidade

      t.timestamps
    end
  end
end
