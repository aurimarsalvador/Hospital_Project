require "test_helper"

class CompraItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compra_item = compra_itens(:one)
  end

  test "should get index" do
    get compra_itens_url
    assert_response :success
  end

  test "should get new" do
    get new_compra_item_url
    assert_response :success
  end

  test "should create compra_item" do
    assert_difference("CompraItem.count") do
      post compra_itens_url, params: { compra_item: { quantidade: @compra_item.quantidade, valor_total: @compra_item.valor_total, valor_unitario: @compra_item.valor_unitario } }
    end

    assert_redirected_to compra_item_url(CompraItem.last)
  end

  test "should show compra_item" do
    get compra_item_url(@compra_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_compra_item_url(@compra_item)
    assert_response :success
  end

  test "should update compra_item" do
    patch compra_item_url(@compra_item), params: { compra_item: { quantidade: @compra_item.quantidade, valor_total: @compra_item.valor_total, valor_unitario: @compra_item.valor_unitario } }
    assert_redirected_to compra_item_url(@compra_item)
  end

  test "should destroy compra_item" do
    assert_difference("CompraItem.count", -1) do
      delete compra_item_url(@compra_item)
    end

    assert_redirected_to compra_itens_url
  end
end
