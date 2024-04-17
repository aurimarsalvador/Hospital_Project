json.extract! venda_item, :id, :valor_unitario, :valor_total, :quantidade, :created_at, :updated_at
json.url venda_item_url(venda_item, format: :json)
