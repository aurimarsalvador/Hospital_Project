class CreateCompras < ActiveRecord::Migration[7.1]
  def change
    create_table :compras do |t|
      t.datetime :data_entrada

      t.timestamps
    end
  end
end
