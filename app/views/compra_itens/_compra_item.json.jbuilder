json.extract! compra_item, :id, :valor_unitario, :valor_total, :quantidade, :created_at, :updated_at
json.url compra_item_url(compra_item, format: :json)
