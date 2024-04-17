class VendaItensController < ApplicationController
  before_action :set_venda_item, only: %i[ show edit update destroy ]

  # GET /venda_itens or /venda_itens.json
  def index
    @venda_itens = VendaItem.all
  end

  # GET /venda_itens/1 or /venda_itens/1.json
  def show
  end

  # GET /venda_itens/new
  def new
    @venda_item = VendaItem.new
  end

  # GET /venda_itens/1/edit
  def edit
  end

  # POST /venda_itens or /venda_itens.json
  def create
    @venda_item = VendaItem.new(venda_item_params)

    respond_to do |format|
      if @venda_item.save
        format.html { redirect_to venda_item_url(@venda_item), notice: "Venda item was successfully created." }
        format.json { render :show, status: :created, location: @venda_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venda_itens/1 or /venda_itens/1.json
  def update
    respond_to do |format|
      if @venda_item.update(venda_item_params)
        format.html { redirect_to venda_item_url(@venda_item), notice: "Venda item was successfully updated." }
        format.json { render :show, status: :ok, location: @venda_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venda_itens/1 or /venda_itens/1.json
  def destroy
    @venda_item.destroy!

    respond_to do |format|
      format.html { redirect_to venda_itens_url, notice: "Venda item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda_item
      @venda_item = VendaItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venda_item_params
      params.require(:venda_item).permit!
    end
end
