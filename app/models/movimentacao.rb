class Movimentacao < ApplicationRecord
  belongs_to :produto
  belongs_to :armazenamento
end
