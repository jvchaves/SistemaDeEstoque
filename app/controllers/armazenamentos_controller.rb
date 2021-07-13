class ArmazenamentosController < ApplicationController
  before_action :set_armazenamento, only: %i[ show edit update destroy ]

  # GET /armazenamentos or /armazenamentos.json
  def index
    @armazenamentos = Armazenamento.all
  end

  # GET /armazenamentos/1 or /armazenamentos/1.json
  def show
  end

  # GET /armazenamentos/new
  def new
    @armazenamento = Armazenamento.new
  end

  # GET /armazenamentos/1/edit
  def edit
  end

  # POST /armazenamentos or /armazenamentos.json
  def create
    @armazenamento = Armazenamento.new(armazenamento_params)

    respond_to do |format|
      if @armazenamento.save
        format.html { redirect_to @armazenamento, notice: "Armazenamento was successfully created." }
        format.json { render :show, status: :created, location: @armazenamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @armazenamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armazenamentos/1 or /armazenamentos/1.json
  def update
    respond_to do |format|
      if @armazenamento.update(armazenamento_params)
        format.html { redirect_to @armazenamento, notice: "Armazenamento was successfully updated." }
        format.json { render :show, status: :ok, location: @armazenamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @armazenamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armazenamentos/1 or /armazenamentos/1.json
  def destroy
    @armazenamento.destroy
    respond_to do |format|
      format.html { redirect_to armazenamentos_url, notice: "Armazenamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armazenamento
      @armazenamento = Armazenamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def armazenamento_params
      params.require(:armazenamento).permit(:nome)
    end
end
