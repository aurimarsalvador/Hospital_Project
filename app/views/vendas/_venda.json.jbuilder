json.extract! venda, :id, :data_saida, :numero_de_parcelas, :dias_intervalo, :valor_total, :valor_a_prazo, :valor_a_vista, :created_at, :updated_at
json.url venda_url(venda, format: :json)
