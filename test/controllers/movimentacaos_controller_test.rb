require "test_helper"

class MovimentacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movimentacao = movimentacaos(:one)
  end

  test "should get index" do
    get movimentacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_movimentacao_url
    assert_response :success
  end

  test "should create movimentacao" do
    assert_difference('Movimentacao.count') do
      post movimentacaos_url, params: { movimentacao: { armazenamento_id: @movimentacao.armazenamento_id, produto_id: @movimentacao.produto_id, quantidade: @movimentacao.quantidade, tipo: @movimentacao.tipo } }
    end

    assert_redirected_to movimentacao_url(Movimentacao.last)
  end

  test "should show movimentacao" do
    get movimentacao_url(@movimentacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_movimentacao_url(@movimentacao)
    assert_response :success
  end

  test "should update movimentacao" do
    patch movimentacao_url(@movimentacao), params: { movimentacao: { armazenamento_id: @movimentacao.armazenamento_id, produto_id: @movimentacao.produto_id, quantidade: @movimentacao.quantidade, tipo: @movimentacao.tipo } }
    assert_redirected_to movimentacao_url(@movimentacao)
  end

  test "should destroy movimentacao" do
    assert_difference('Movimentacao.count', -1) do
      delete movimentacao_url(@movimentacao)
    end

    assert_redirected_to movimentacaos_url
  end
end
