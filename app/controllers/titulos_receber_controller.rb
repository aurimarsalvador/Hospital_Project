class TitulosReceberController < ApplicationController
  before_action :set_titulo_receber, only: %i[ show edit update destroy ]

  # GET /titulos_receber or /titulos_receber.json
  def index
    @titulos_receber = TituloReceber.all
  end

  # GET /titulos_receber/1 or /titulos_receber/1.json
  def show
  end

  # GET /titulos_receber/new
  def new
    @titulo_receber = TituloReceber.new
  end

  # GET /titulos_receber/1/edit
  def edit
  end

  # POST /titulos_receber or /titulos_receber.json
  def create
    @titulo_receber = TituloReceber.new(titulo_receber_params)

    respond_to do |format|
      if @titulo_receber.save
        format.html { redirect_to titulo_receber_url(@titulo_receber), notice: "Titulo receber was successfully created." }
        format.json { render :show, status: :created, location: @titulo_receber }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @titulo_receber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titulos_receber/1 or /titulos_receber/1.json
  def update
    respond_to do |format|
      if @titulo_receber.update(titulo_receber_params)
        format.html { redirect_to titulo_receber_url(@titulo_receber), notice: "Titulo receber was successfully updated." }
        format.json { render :show, status: :ok, location: @titulo_receber }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @titulo_receber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titulos_receber/1 or /titulos_receber/1.json
  def destroy
    @titulo_receber.destroy!

    respond_to do |format|
      format.html { redirect_to titulos_receber_url, notice: "Titulo receber was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_titulo_receber
      @titulo_receber = TituloReceber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def titulo_receber_params
      params.require(:titulo_receber).permit(:numero_parcela, :data_vencimento, :valor_parcela)
    end
end
