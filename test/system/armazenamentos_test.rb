require "application_system_test_case"

class ArmazenamentosTest < ApplicationSystemTestCase
  setup do
    @armazenamento = armazenamentos(:one)
  end

  test "visiting the index" do
    visit armazenamentos_url
    assert_selector "h1", text: "Armazenamentos"
  end

  test "creating a Armazenamento" do
    visit armazenamentos_url
    click_on "New Armazenamento"

    fill_in "Nome", with: @armazenamento.nome
    click_on "Create Armazenamento"

    assert_text "Armazenamento was successfully created"
    click_on "Back"
  end

  test "updating a Armazenamento" do
    visit armazenamentos_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @armazenamento.nome
    click_on "Update Armazenamento"

    assert_text "Armazenamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Armazenamento" do
    visit armazenamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Armazenamento was successfully destroyed"
  end
end
