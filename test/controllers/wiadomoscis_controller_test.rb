require 'test_helper'

class WiadomoscisControllerTest < ActionController::TestCase
  setup do
    @wiadomosci = wiadomoscis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wiadomoscis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wiadomosci" do
    assert_difference('Wiadomosci.count') do
      post :create, wiadomosci: {  }
    end

    assert_redirected_to wiadomosci_path(assigns(:wiadomosci))
  end

  test "should show wiadomosci" do
    get :show, id: @wiadomosci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wiadomosci
    assert_response :success
  end

  test "should update wiadomosci" do
    patch :update, id: @wiadomosci, wiadomosci: {  }
    assert_redirected_to wiadomosci_path(assigns(:wiadomosci))
  end

  test "should destroy wiadomosci" do
    assert_difference('Wiadomosci.count', -1) do
      delete :destroy, id: @wiadomosci
    end

    assert_redirected_to wiadomoscis_path
  end
end
