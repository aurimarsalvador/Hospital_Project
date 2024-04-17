require "application_system_test_case"

class TituloRecebersTest < ApplicationSystemTestCase
  setup do
    @titulo_receber = titulos_receber(:one)
  end

  test "visiting the index" do
    visit titulos_receber_url
    assert_selector "h1", text: "Titulo recebers"
  end

  test "should create titulo receber" do
    visit titulos_receber_url
    click_on "New titulo receber"

    fill_in "Data vencimento", with: @titulo_receber.data_vencimento
    fill_in "Numero parcela", with: @titulo_receber.numero_parcela
    fill_in "Valor parcela", with: @titulo_receber.valor_parcela
    click_on "Create Titulo receber"

    assert_text "Titulo receber was successfully created"
    click_on "Back"
  end

  test "should update Titulo receber" do
    visit titulo_receber_url(@titulo_receber)
    click_on "Edit this titulo receber", match: :first

    fill_in "Data vencimento", with: @titulo_receber.data_vencimento
    fill_in "Numero parcela", with: @titulo_receber.numero_parcela
    fill_in "Valor parcela", with: @titulo_receber.valor_parcela
    click_on "Update Titulo receber"

    assert_text "Titulo receber was successfully updated"
    click_on "Back"
  end

  test "should destroy Titulo receber" do
    visit titulo_receber_url(@titulo_receber)
    click_on "Destroy this titulo receber", match: :first

    assert_text "Titulo receber was successfully destroyed"
  end
end
