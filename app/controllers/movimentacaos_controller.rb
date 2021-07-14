class MovimentacaosController < ApplicationController
  before_action :set_movimentacao, only: %i[ show edit update destroy ]
  require 'csv'
  # GET /movimentacaos or /movimentacaos.json
  def index
    @movimentacaos = Movimentacao.all
  end

  # GET /movimentacaos/1 or /movimentacaos/1.json
  def show
  end

  # GET /movimentacaos/new
  def new
    @movimentacao = Movimentacao.new
  end

  # GET /movimentacaos/1/edit
  def edit
  end
  def create_by_csv
    @estoques = CSV.parse(params[:csv].read,{col_sep:';',headers:true}) rescue nil
    @produtos = Produto.all
    @depositos = Armazenamento.all
    binding.pry
    if @estoques.present?
      @estoques.each do |estoque|
        @produto = @produtos.where(nome:estoque['Produto'].downcase).first
        @deposito = @depositos.where(nome:estoque['Nome do deposito'].downcase).first
        if @produto.nil?
          @produto = Produto.create({nome:estoque['Produto'].downcase})
          @produto.save
        end
        if @deposito.nil?
          @deposito = Armazenamento.create({nome:estoque['Nome do deposito'].downcase})
          @deposito.save
        end
          @movimentacao = Movimentacao.new({produto_id: @produto.id, armazenamento_id: @deposito.id, tipo: estoque['Tipo de Movimentacao'].upcase, quantidade: estoque['Quantidade'].to_i, data_movimentacao: estoque['Data'].to_date})
          @movimentacao.save



      end
      flash[:notice] = "Importação Cadastrada com Sucesso!"
      redirect_to "/movimentacaos/total_armazenado"
    end

  end
  # POST /movimentacaos or /movimentacaos.json
  def create
    @movimentacao = Movimentacao.new(movimentacao_params)
    @movimentacao.tipo = params[:tipo].upcase
    @armazenamento = Armazenamento.where(nome: movimentacao_params[:armazenamento_id].downcase).first
    @movimentacao.data_movimentacao = params[:data].to_date + 3.hours
    @produto = Produto.where(nome: movimentacao_params[:produto_id].downcase).first
    if @produto.present?
      @movimentacao.produto_id = @produto.id
    else
      @produto = Produto.create({nome:movimentacao_params[:produto_id].downcase})
      @produto.save
      @movimentacao.produto_id = @produto.id
    end
    if @armazenamento.present?

      @movimentacao.armazenamento_id = @armazenamento.id
    else
      @armazenamento = Armazenamento.create({nome:movimentacao_params[:armazenamento_id].downcase})
      @armazenamento.save
      @movimentacao.armazenamento_id = @armazenamento.id
    end

    respond_to do |format|
      if @movimentacao.save
        format.html { redirect_to @movimentacao, notice: "Movimentacao was successfully created." }
        format.json { render :show, status: :created, location: @movimentacao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movimentacao.errors, status: :unprocessable_entity }
      end
    end
  end
  def total_armazenado
  @movimentacoes = Movimentacao.joins(:produto).joins(:armazenamento).select('armazenamentos.nome,produtos.nome').group('armazenamentos.nome').group('produtos.nome').sum(:quantidade).to_a

  end
  # PATCH/PUT /movimentacaos/1 or /movimentacaos/1.json
  def update
    respond_to do |format|
      @movimentacao.tipo = params[:tipo].upcase
      if @movimentacao.update(movimentacao_params)
        format.html { redirect_to @movimentacao, notice: "Movimentação Atualizada com Sucesso." }
        format.json { render :show, status: :ok, location: @movimentacao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movimentacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimentacaos/1 or /movimentacaos/1.json
  def destroy
    @movimentacao.destroy
    respond_to do |format|
      format.html { redirect_to movimentacaos_url, notice: "Movimentação Apagada com Sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimentacao
      @movimentacao = Movimentacao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movimentacao_params
      params.require(:movimentacao).permit(:produto_id, :armazenamento_id, :tipo, :quantidade, :csv, :data)
    end
end
