class Movimentacao < ApplicationRecord
  belongs_to :produto
  belongs_to :armazenamento

  validate :escolha_tipo, on: :create
  validate :verifica_estoque, on: :create
  validate :valida_data, on: :create
  def valida_data
      min_valido = '01/01/2021'
      max_valido = '31/01/2021'
      min_valido = min_valido.to_datetime
      max_valido = max_valido.to_datetime + 23.hours + 59.minute + 59.second
    # binding.pry
    if self.data_movimentacao >= min_valido and self.data_movimentacao <= max_valido
      return true
    else
      errors.add(:base,"Data de movimentação Invalida")
    end
  end
  def escolha_tipo
    if    self.tipo == "S" and self.quantidade > 0
      self.quantidade	= (-1)*self.quantidade
    elsif self.tipo ==  'E' and self.quantidade < 0

      self.quantidade	= (-1)*self.quantidade
    end
  end
  def verifica_estoque
    if self.tipo == "S"
      estoque_total = Movimentacao.where("produto_id = ? AND armazenamento_id = ? AND tipo = 'E'",self.produto_id,self.armazenamento_id).sum(:quantidade)
        if estoque_total + self.quantidade  < 0
          errors.add(:base,"Estoque não pode ficar negativo")
        end
    end
  end
end
