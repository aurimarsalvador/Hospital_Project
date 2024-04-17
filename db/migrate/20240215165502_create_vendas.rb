class CreateVendas < ActiveRecord::Migration[7.1]
  def change
    create_table :vendas do |t|
      t.datetime :data_saida
      t.integer :numero_de_parcelas
      t.integer :dias_intervalo
      t.decimal :valor_total
      t.decimal :valor_a_prazo
      t.decimal :valor_a_vista

      t.timestamps
    end
  end
end
