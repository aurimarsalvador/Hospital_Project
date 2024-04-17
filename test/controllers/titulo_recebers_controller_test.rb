require "test_helper"

class TituloRecebersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @titulo_receber = titulos_receber(:one)
  end

  test "should get index" do
    get titulos_receber_url
    assert_response :success
  end

  test "should get new" do
    get new_titulo_receber_url
    assert_response :success
  end

  test "should create titulo_receber" do
    assert_difference("TituloReceber.count") do
      post titulos_receber_url, params: { titulo_receber: { data_vencimento: @titulo_receber.data_vencimento, numero_parcela: @titulo_receber.numero_parcela, valor_parcela: @titulo_receber.valor_parcela } }
    end

    assert_redirected_to titulo_receber_url(TituloReceber.last)
  end

  test "should show titulo_receber" do
    get titulo_receber_url(@titulo_receber)
    assert_response :success
  end

  test "should get edit" do
    get edit_titulo_receber_url(@titulo_receber)
    assert_response :success
  end

  test "should update titulo_receber" do
    patch titulo_receber_url(@titulo_receber), params: { titulo_receber: { data_vencimento: @titulo_receber.data_vencimento, numero_parcela: @titulo_receber.numero_parcela, valor_parcela: @titulo_receber.valor_parcela } }
    assert_redirected_to titulo_receber_url(@titulo_receber)
  end

  test "should destroy titulo_receber" do
    assert_difference("TituloReceber.count", -1) do
      delete titulo_receber_url(@titulo_receber)
    end

    assert_redirected_to titulos_receber_url
  end
end
