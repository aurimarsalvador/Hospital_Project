class TitulosPagarController < ApplicationController
  before_action :set_titulo_pagar, only: %i[ show edit update destroy ]

  # GET /titulos_pagar or /titulos_pagar.json
  def index
    @titulos_pagar = TituloPagar.all
  end

  # GET /titulos_pagar/1 or /titulos_pagar/1.json
  def show
  end

  # GET /titulos_pagar/new
  def new
    @titulo_pagar = TituloPagar.new
  end

  # GET /titulos_pagar/1/edit
  def edit
  end

  # POST /titulos_pagar or /titulos_pagar.json
  def create
    @titulo_pagar = TituloPagar.new(titulo_pagar_params)

    respond_to do |format|
      if @titulo_pagar.save
        format.html { redirect_to titulo_pagar_url(@titulo_pagar), notice: "Titulo pagar was successfully created." }
        format.json { render :show, status: :created, location: @titulo_pagar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @titulo_pagar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titulos_pagar/1 or /titulos_pagar/1.json
  def update
    respond_to do |format|
      if @titulo_pagar.update(titulo_pagar_params)
        format.html { redirect_to titulo_pagar_url(@titulo_pagar), notice: "Titulo pagar was successfully updated." }
        format.json { render :show, status: :ok, location: @titulo_pagar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @titulo_pagar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titulos_pagar/1 or /titulos_pagar/1.json
  def destroy
    @titulo_pagar.destroy!

    respond_to do |format|
      format.html { redirect_to titulos_pagar_url, notice: "Titulo pagar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_titulo_pagar
      @titulo_pagar = TituloPagar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def titulo_pagar_params
      params.require(:titulo_pagar).permit(:numero_parcela, :data_vencimento, :valor_parcela)
    end
end
