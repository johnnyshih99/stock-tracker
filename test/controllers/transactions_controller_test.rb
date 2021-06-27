require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get transactions_destroy_url
    assert_response :success
  end
end
