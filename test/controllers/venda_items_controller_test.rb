require "test_helper"

class VendaItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venda_item = venda_itens(:one)
  end

  test "should get index" do
    get venda_itens_url
    assert_response :success
  end

  test "should get new" do
    get new_venda_item_url
    assert_response :success
  end

  test "should create venda_item" do
    assert_difference("VendaItem.count") do
      post venda_itens_url, params: { venda_item: { quantidade: @venda_item.quantidade, valor_total: @venda_item.valor_total, valor_unitario: @venda_item.valor_unitario } }
    end

    assert_redirected_to venda_item_url(VendaItem.last)
  end

  test "should show venda_item" do
    get venda_item_url(@venda_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_venda_item_url(@venda_item)
    assert_response :success
  end

  test "should update venda_item" do
    patch venda_item_url(@venda_item), params: { venda_item: { quantidade: @venda_item.quantidade, valor_total: @venda_item.valor_total, valor_unitario: @venda_item.valor_unitario } }
    assert_redirected_to venda_item_url(@venda_item)
  end

  test "should destroy venda_item" do
    assert_difference("VendaItem.count", -1) do
      delete venda_item_url(@venda_item)
    end

    assert_redirected_to venda_itens_url
  end
end
