class ComprasController < ApplicationController
  before_action :set_compra, only: %i[ show edit update destroy ]
  before_action :set_fornecedor, only: %i[ show new create edit update ]
  before_action :set_produto, only: %i[ show new create edit update ]

  # GET /compras or /compras.json
  def index
    @compras = Compra.all
  end

  # GET /compras/1 or /compras/1.json
  def show
  end

  # GET /compras/new
  def new
    @compra = Compra.new
    @compra.compra_itens.build
  end

  # GET /compras/1/edit
  def edit

  end

  # POST /compras or /compras.json
  def create
    @compra = Compra.new(compra_params)

    respond_to do |format|
      if @compra.save
        format.html { redirect_to compra_url(@compra), notice: "Compra (NF-e) #{@compra.id} registrada com sucesso!" }
        format.json { render :show, status: :created, location: @compra }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compras/1 or /compras/1.json
  def update
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to compra_url(@compra), notice: "Compra (NF-e) #{@compra.id} atualizada com sucesso!" }
        format.json { render :show, status: :ok, location: @compra }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1 or /compras/1.json
  def destroy
    @compra.destroy!

    respond_to do |format|
      format.html { redirect_to compras_url, notice: "Compra (NF-e) #{@compra.id} cancelada com sucesso!" }
      format.json { head :no_content }
    end
  end

  def set_fornecedor
    @fornecedores = Fornecedor.all
  end

  def set_produto
    @produtos = Produto.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compra_params
      params.require(:compra).permit(:data_entrada, :fornecedor_id, :dias_intervalo, :numero_de_parcelas, :valor_a_prazo, :valor_total, :valor_a_vista, compra_itens_attributes: [:compra_id, :valor_unitario, :valor_total, :quantidade, :produto_id, :_destroy])
    end

end
