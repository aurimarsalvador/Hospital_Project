class CreateTitulosReceber < ActiveRecord::Migration[7.1]
  def change
    create_table :titulos_receber do |t|
      t.integer :numero_parcela
      t.date :data_vencimento
      t.decimal :valor_parcela

      t.timestamps
    end
  end
end
