class Movimentacao < ApplicationRecord
  belongs_to :produto
  belongs_to :armazenamento
  # validate :pode
  def pode(produto,armazenamento,tipo,data)

    binding.pry
  end
end
