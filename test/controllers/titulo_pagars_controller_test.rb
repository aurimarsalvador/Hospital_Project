require "test_helper"

class TituloPagarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @titulo_pagar = titulos_pagar(:one)
  end

  test "should get index" do
    get titulos_pagar_url
    assert_response :success
  end

  test "should get new" do
    get new_titulo_pagar_url
    assert_response :success
  end

  test "should create titulo_pagar" do
    assert_difference("TituloPagar.count") do
      post titulos_pagar_url, params: { titulo_pagar: { data_vencimento: @titulo_pagar.data_vencimento, numero_parcela: @titulo_pagar.numero_parcela, valor_parcela: @titulo_pagar.valor_parcela } }
    end

    assert_redirected_to titulo_pagar_url(TituloPagar.last)
  end

  test "should show titulo_pagar" do
    get titulo_pagar_url(@titulo_pagar)
    assert_response :success
  end

  test "should get edit" do
    get edit_titulo_pagar_url(@titulo_pagar)
    assert_response :success
  end

  test "should update titulo_pagar" do
    patch titulo_pagar_url(@titulo_pagar), params: { titulo_pagar: { data_vencimento: @titulo_pagar.data_vencimento, numero_parcela: @titulo_pagar.numero_parcela, valor_parcela: @titulo_pagar.valor_parcela } }
    assert_redirected_to titulo_pagar_url(@titulo_pagar)
  end

  test "should destroy titulo_pagar" do
    assert_difference("TituloPagar.count", -1) do
      delete titulo_pagar_url(@titulo_pagar)
    end

    assert_redirected_to titulos_pagar_url
  end
end
