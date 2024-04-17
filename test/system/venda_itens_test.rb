require "application_system_test_case"

class VendaItemsTest < ApplicationSystemTestCase
  setup do
    @venda_item = venda_itens(:one)
  end

  test "visiting the index" do
    visit venda_itens_url
    assert_selector "h1", text: "Venda items"
  end

  test "should create venda item" do
    visit venda_itens_url
    click_on "New venda item"

    fill_in "Quantidade", with: @venda_item.quantidade
    fill_in "Valor total", with: @venda_item.valor_total
    fill_in "Valor unitario", with: @venda_item.valor_unitario
    click_on "Create Venda item"

    assert_text "Venda item was successfully created"
    click_on "Back"
  end

  test "should update Venda item" do
    visit venda_item_url(@venda_item)
    click_on "Edit this venda item", match: :first

    fill_in "Quantidade", with: @venda_item.quantidade
    fill_in "Valor total", with: @venda_item.valor_total
    fill_in "Valor unitario", with: @venda_item.valor_unitario
    click_on "Update Venda item"

    assert_text "Venda item was successfully updated"
    click_on "Back"
  end

  test "should destroy Venda item" do
    visit venda_item_url(@venda_item)
    click_on "Destroy this venda item", match: :first

    assert_text "Venda item was successfully destroyed"
  end
end
