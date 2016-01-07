require 'test_helper'

class KontoControllerTest < ActionController::TestCase
  test "should get rejestracja" do
    get :rejestracja
    assert_response :success
  end

  test "should get logowanie" do
    get :logowanie
    assert_response :success
  end

  test "should get pierwsze_logowanie" do
    get :pierwsze_logowanie
    assert_response :success
  end

  test "should get wykladowca" do
    get :wykladowca
    assert_response :success
  end

  test "should get student" do
    get :student
    assert_response :success
  end

end
