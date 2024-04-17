require "application_system_test_case"

class CompraItemsTest < ApplicationSystemTestCase
  setup do
    @compra_item = compra_itens(:one)
  end

  test "visiting the index" do
    visit compra_itens_url
    assert_selector "h1", text: "Compra items"
  end

  test "should create compra item" do
    visit compra_itens_url
    click_on "New compra item"

    fill_in "Quantidade", with: @compra_item.quantidade
    fill_in "Valor total", with: @compra_item.valor_total
    fill_in "Valor unitario", with: @compra_item.valor_unitario
    click_on "Create Compra item"

    assert_text "Compra item was successfully created"
    click_on "Back"
  end

  test "should update Compra item" do
    visit compra_item_url(@compra_item)
    click_on "Edit this compra item", match: :first

    fill_in "Quantidade", with: @compra_item.quantidade
    fill_in "Valor total", with: @compra_item.valor_total
    fill_in "Valor unitario", with: @compra_item.valor_unitario
    click_on "Update Compra item"

    assert_text "Compra item was successfully updated"
    click_on "Back"
  end

  test "should destroy Compra item" do
    visit compra_item_url(@compra_item)
    click_on "Destroy this compra item", match: :first

    assert_text "Compra item was successfully destroyed"
  end
end
