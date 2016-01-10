require 'test_helper'

class GrupiesControllerTest < ActionController::TestCase
  setup do
    @grupy = grupies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grupies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grupy" do
    assert_difference('Grupy.count') do
      post :create, grupy: {  }
    end

    assert_redirected_to grupy_path(assigns(:grupy))
  end

  test "should show grupy" do
    get :show, id: @grupy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grupy
    assert_response :success
  end

  test "should update grupy" do
    patch :update, id: @grupy, grupy: {  }
    assert_redirected_to grupy_path(assigns(:grupy))
  end

  test "should destroy grupy" do
    assert_difference('Grupy.count', -1) do
      delete :destroy, id: @grupy
    end

    assert_redirected_to grupies_path
  end
end
