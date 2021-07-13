require "application_system_test_case"

class MovimentacaosTest < ApplicationSystemTestCase
  setup do
    @movimentacao = movimentacaos(:one)
  end

  test "visiting the index" do
    visit movimentacaos_url
    assert_selector "h1", text: "Movimentacaos"
  end

  test "creating a Movimentacao" do
    visit movimentacaos_url
    click_on "New Movimentacao"

    fill_in "Armazenamento", with: @movimentacao.armazenamento_id
    fill_in "Produto", with: @movimentacao.produto_id
    fill_in "Quantidade", with: @movimentacao.quantidade
    fill_in "Tipo", with: @movimentacao.tipo
    click_on "Create Movimentacao"

    assert_text "Movimentacao was successfully created"
    click_on "Back"
  end

  test "updating a Movimentacao" do
    visit movimentacaos_url
    click_on "Edit", match: :first

    fill_in "Armazenamento", with: @movimentacao.armazenamento_id
    fill_in "Produto", with: @movimentacao.produto_id
    fill_in "Quantidade", with: @movimentacao.quantidade
    fill_in "Tipo", with: @movimentacao.tipo
    click_on "Update Movimentacao"

    assert_text "Movimentacao was successfully updated"
    click_on "Back"
  end

  test "destroying a Movimentacao" do
    visit movimentacaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movimentacao was successfully destroyed"
  end
end
