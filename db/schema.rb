# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_15_182012) do
  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf_cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compra_itens", force: :cascade do |t|
    t.decimal "valor_unitario"
    t.decimal "valor_total"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "compra_id", null: false
    t.integer "produto_id", null: false
    t.index ["compra_id"], name: "index_compra_itens_on_compra_id"
    t.index ["produto_id"], name: "index_compra_itens_on_produto_id"
  end

  create_table "compras", force: :cascade do |t|
    t.datetime "data_entrada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fornecedor_id", null: false
    t.integer "numero_de_parcelas"
    t.integer "dias_intervalo"
    t.decimal "valor_total"
    t.decimal "valor_a_prazo"
    t.decimal "valor_a_vista"
    t.index ["fornecedor_id"], name: "index_compras_on_fornecedor_id"
  end

  create_table "estoques", force: :cascade do |t|
    t.integer "competencia"
    t.integer "qtde_entrada"
    t.integer "qtde_saida"
    t.integer "qtde_estoque"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "produto_id", null: false
    t.index ["produto_id"], name: "index_estoques_on_produto_id"
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string "nome"
    t.string "cpf_cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.decimal "preco_venda"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titulos_pagar", force: :cascade do |t|
    t.integer "numero_parcela"
    t.date "data_vencimento"
    t.decimal "valor_parcela"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "compra_id", null: false
    t.index ["compra_id"], name: "index_titulos_pagar_on_compra_id"
  end

  create_table "titulos_receber", force: :cascade do |t|
    t.integer "numero_parcela"
    t.date "data_vencimento"
    t.decimal "valor_parcela"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venda_id", null: false
    t.index ["venda_id"], name: "index_titulos_receber_on_venda_id"
  end

  create_table "venda_itens", force: :cascade do |t|
    t.decimal "valor_unitario"
    t.decimal "valor_total"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venda_id", null: false
    t.integer "produto_id", null: false
    t.index ["produto_id"], name: "index_venda_itens_on_produto_id"
    t.index ["venda_id"], name: "index_venda_itens_on_venda_id"
  end

  create_table "vendas", force: :cascade do |t|
    t.datetime "data_saida"
    t.integer "numero_de_parcelas"
    t.integer "dias_intervalo"
    t.decimal "valor_total"
    t.decimal "valor_a_prazo"
    t.decimal "valor_a_vista"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id", null: false
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
  end

  add_foreign_key "compra_itens", "compras"
  add_foreign_key "compra_itens", "produtos"
  add_foreign_key "compras", "fornecedores"
  add_foreign_key "estoques", "produtos"
  add_foreign_key "titulos_pagar", "compras"
  add_foreign_key "titulos_receber", "vendas"
  add_foreign_key "venda_itens", "produtos"
  add_foreign_key "venda_itens", "vendas"
  add_foreign_key "vendas", "clientes"
end
