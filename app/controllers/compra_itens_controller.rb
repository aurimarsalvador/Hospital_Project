class CompraItensController < ApplicationController
  before_action :set_compra_item, only: %i[ show new edit update destroy ]

  # GET /compra_itens or /compra_itens.json
  def index
    @compra_itens = CompraItem.all
  end

  # GET /compra_itens/1 or /compra_itens/1.json
  def show
  end

  # GET /compra_itens/new
  def new
    @compra_item = CompraItem.new
  end

  # GET /compra_itens/1/edit
  def edit
  end

  # POST /compra_itens or /compra_itens.json
  def create
    @compra_item = CompraItem.new(compra_item_params)

    respond_to do |format|
      if @compra_item.save
        format.html { redirect_to compra_item_url(@compra_item), notice: "Compra item was successfully created." }
        format.json { render :show, status: :created, location: @compra_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @compra_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compra_itens/1 or /compra_itens/1.json
  def update
    respond_to do |format|
      if @compra_item.update(compra_item_params)
        format.html { redirect_to compra_item_url(@compra_item), notice: "Compra item was successfully updated." }
        format.json { render :show, status: :ok, location: @compra_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @compra_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compra_itens/1 or /compra_itens/1.json
  def destroy
    @compra_item.destroy!

    respond_to do |format|
      format.html { redirect_to compra_itens_url, notice: "Compra item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra_item
      @compra_item = CompraItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compra_item_params
      params.require(:compra_item).permit!
    end
end
