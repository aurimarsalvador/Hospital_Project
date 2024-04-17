class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]
  before_action :set_cliente, only: %i[ show new create edit update ]
  before_action :set_produto, only: %i[ show new create edit update ]

  # GET /vendas or /vendas.json
  def index
    @vendas = Venda.all
  end

  # GET /vendas/1 or /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
    @venda.venda_itens.build
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas or /vendas.json
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to venda_url(@venda), notice: "Venda (NF-e) #{@venda.id} registrada com sucesso!" }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1 or /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to venda_url(@venda), notice: "Venda (NF-e) #{@venda.id} atualizada com sucesso!" }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1 or /vendas/1.json
  def destroy
    @venda.destroy!

    respond_to do |format|
      format.html { redirect_to vendas_url, notice: "Venda (NF-e) #{@venda.id} cancelada com sucesso!." }
      format.json { head :no_content }
    end
  end

  def set_cliente
    @clientes = Cliente.all
  end

  def set_produto
    @produtos = Produto.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venda_params
      params.require(:venda).permit(:data_saida, :numero_de_parcelas, :dias_intervalo, :valor_total, :valor_a_prazo, :valor_a_vista, :cliente_id, venda_itens_attributes: [:venda_id, :valor_unitario, :valor_total, :quantidade, :produto_id, :_destroy])
    end
end
