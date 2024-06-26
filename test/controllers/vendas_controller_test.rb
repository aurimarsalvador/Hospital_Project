require "test_helper"

class VendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venda = vendas(:one)
  end

  test "should get index" do
    get vendas_url
    assert_response :success
  end

  test "should get new" do
    get new_venda_url
    assert_response :success
  end

  test "should create venda" do
    assert_difference("Venda.count") do
      post vendas_url, params: { venda: { data_saida: @venda.data_saida, dias_intervalo: @venda.dias_intervalo, numero_de_parcelas: @venda.numero_de_parcelas, valor_a_prazo: @venda.valor_a_prazo, valor_a_vista: @venda.valor_a_vista, valor_total: @venda.valor_total } }
    end

    assert_redirected_to venda_url(Venda.last)
  end

  test "should show venda" do
    get venda_url(@venda)
    assert_response :success
  end

  test "should get edit" do
    get edit_venda_url(@venda)
    assert_response :success
  end

  test "should update venda" do
    patch venda_url(@venda), params: { venda: { data_saida: @venda.data_saida, dias_intervalo: @venda.dias_intervalo, numero_de_parcelas: @venda.numero_de_parcelas, valor_a_prazo: @venda.valor_a_prazo, valor_a_vista: @venda.valor_a_vista, valor_total: @venda.valor_total } }
    assert_redirected_to venda_url(@venda)
  end

  test "should destroy venda" do
    assert_difference("Venda.count", -1) do
      delete venda_url(@venda)
    end

    assert_redirected_to vendas_url
  end
end
