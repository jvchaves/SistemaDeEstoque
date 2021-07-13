require "test_helper"

class ArmazenamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @armazenamento = armazenamentos(:one)
  end

  test "should get index" do
    get armazenamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_armazenamento_url
    assert_response :success
  end

  test "should create armazenamento" do
    assert_difference('Armazenamento.count') do
      post armazenamentos_url, params: { armazenamento: { nome: @armazenamento.nome } }
    end

    assert_redirected_to armazenamento_url(Armazenamento.last)
  end

  test "should show armazenamento" do
    get armazenamento_url(@armazenamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_armazenamento_url(@armazenamento)
    assert_response :success
  end

  test "should update armazenamento" do
    patch armazenamento_url(@armazenamento), params: { armazenamento: { nome: @armazenamento.nome } }
    assert_redirected_to armazenamento_url(@armazenamento)
  end

  test "should destroy armazenamento" do
    assert_difference('Armazenamento.count', -1) do
      delete armazenamento_url(@armazenamento)
    end

    assert_redirected_to armazenamentos_url
  end
end
