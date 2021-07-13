class MovimentacaosController < ApplicationController
  before_action :set_movimentacao, only: %i[ show edit update destroy ]

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
  # POST /movimentacaos or /movimentacaos.json
  def create
    @movimentacao = Movimentacao.new(movimentacao_params)
    @armazenamento = Armazenamento.where(nome: movimentacao_params[:armazenamento_id].downcase).first
    @produto = Produto.where(nome: movimentacao_params[:produto_id].downcase).first
    if @produto.present?
      @movimentacao.produto_id = @produto.id
    else
      @produto = Produto.create({nome:movimentacao_params[:produto_id].downcase})
      @produto.save
      @movimentacao.produto_id = @produto.id
    end
    if @armazenamento.present?
      binding.pry
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

  # PATCH/PUT /movimentacaos/1 or /movimentacaos/1.json
  def update
    respond_to do |format|
      if @movimentacao.update(movimentacao_params)
        format.html { redirect_to @movimentacao, notice: "Movimentacao was successfully updated." }
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
      format.html { redirect_to movimentacaos_url, notice: "Movimentacao was successfully destroyed." }
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
      params.require(:movimentacao).permit(:produto_id, :armazenamento_id, :tipo, :quantidade)
    end
end
