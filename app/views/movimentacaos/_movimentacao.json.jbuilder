json.extract! movimentacao, :id, :produto_id, :armazenamento_id, :tipo, :quantidade, :created_at, :updated_at
json.url movimentacao_url(movimentacao, format: :json)
