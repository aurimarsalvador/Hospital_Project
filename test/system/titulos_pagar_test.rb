require "application_system_test_case"

class TituloPagarsTest < ApplicationSystemTestCase
  setup do
    @titulo_pagar = titulos_pagar(:one)
  end

  test "visiting the index" do
    visit titulos_pagar_url
    assert_selector "h1", text: "Titulo pagars"
  end

  test "should create titulo pagar" do
    visit titulos_pagar_url
    click_on "New titulo pagar"

    fill_in "Data vencimento", with: @titulo_pagar.data_vencimento
    fill_in "Numero parcela", with: @titulo_pagar.numero_parcela
    fill_in "Valor parcela", with: @titulo_pagar.valor_parcela
    click_on "Create Titulo pagar"

    assert_text "Titulo pagar was successfully created"
    click_on "Back"
  end

  test "should update Titulo pagar" do
    visit titulo_pagar_url(@titulo_pagar)
    click_on "Edit this titulo pagar", match: :first

    fill_in "Data vencimento", with: @titulo_pagar.data_vencimento
    fill_in "Numero parcela", with: @titulo_pagar.numero_parcela
    fill_in "Valor parcela", with: @titulo_pagar.valor_parcela
    click_on "Update Titulo pagar"

    assert_text "Titulo pagar was successfully updated"
    click_on "Back"
  end

  test "should destroy Titulo pagar" do
    visit titulo_pagar_url(@titulo_pagar)
    click_on "Destroy this titulo pagar", match: :first

    assert_text "Titulo pagar was successfully destroyed"
  end
end
