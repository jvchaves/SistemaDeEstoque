require "test_helper"

class CsvControllerTest < ActionDispatch::IntegrationTest
  test "should get exportaMovimentacao" do
    get csv_exportaMovimentacao_url
    assert_response :success
  end
end
