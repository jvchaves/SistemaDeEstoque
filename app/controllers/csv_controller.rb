class CsvController < ApplicationController
  require 'csv'
  def exportaMovimentacao
    @movimentacoes = Movimentacao.all
    if @movimentacoes.present?
      cabecalho = ['Nome do deposito','Data','Tipo de Movimentacao','Produto','Quantidade']
      @exportar = CSV.generate(col_sep: ';') do |csv|
        csv << cabecalho
        @movimentacoes.each do |movimentacao|
          csv << [movimentacao.armazenamento.nome,movimentacao.data_movimentacao.strftime("%d/%m/%Y").to_date,movimentacao.tipo,movimentacao.produto.nome,movimentacao.quantidade]
        end
      end

      send_data @exportar, filename: "movimentacao_de_estoque.csv"
    else
      flash[:notice] = 'Não há dados para serem exportados'
    end
  end
end
