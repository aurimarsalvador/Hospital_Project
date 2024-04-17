class CreateProdutos < ActiveRecord::Migration[7.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.decimal :preco_venda

      t.timestamps
    end
  end
end
