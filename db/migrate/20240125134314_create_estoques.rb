class CreateEstoques < ActiveRecord::Migration[7.1]
  def change
    create_table :estoques do |t|
      t.integer :competencia
      t.integer :qtde_entrada
      t.integer :qtde_saida
      t.integer :qtde_estoque

      t.timestamps
    end
  end
end
