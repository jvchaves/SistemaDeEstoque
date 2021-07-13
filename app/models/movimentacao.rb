class Movimentacao < ApplicationRecord
  belongs_to :produto
  belongs_to :armazenamento
  # validate :pode
  #
  def escolha_tipo
    if    self.tipo == "E"

    elsif self.tipo == "S"
      self.quantidade	= (-1)*self.quantidade
    end
  end
end
