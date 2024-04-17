class AddClienteToVenda < ActiveRecord::Migration[7.1]
  def change
    add_reference :vendas, :cliente, null: false, foreign_key: true
  end
end
