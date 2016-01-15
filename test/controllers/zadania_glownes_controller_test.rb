require 'test_helper'

class ZadaniaGlownesControllerTest < ActionController::TestCase
  setup do
    @zadania_glowne = zadania_glownes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zadania_glownes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zadania_glowne" do
    assert_difference('ZadaniaGlowne.count') do
      post :create, zadania_glowne: {  }
    end

    assert_redirected_to zadania_glowne_path(assigns(:zadania_glowne))
  end

  test "should show zadania_glowne" do
    get :show, id: @zadania_glowne
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zadania_glowne
    assert_response :success
  end

  test "should update zadania_glowne" do
    patch :update, id: @zadania_glowne, zadania_glowne: {  }
    assert_redirected_to zadania_glowne_path(assigns(:zadania_glowne))
  end

  test "should destroy zadania_glowne" do
    assert_difference('ZadaniaGlowne.count', -1) do
      delete :destroy, id: @zadania_glowne
    end

    assert_redirected_to zadania_glownes_path
  end
end
