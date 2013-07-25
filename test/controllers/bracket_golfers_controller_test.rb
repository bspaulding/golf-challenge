require 'test_helper'

class BracketGolfersControllerTest < ActionController::TestCase
  setup do
    @bracket_golfer = bracket_golfers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bracket_golfers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bracket_golfer" do
    assert_difference('BracketGolfer.count') do
      post :create, bracket_golfer: { bracket_id: @bracket_golfer.bracket_id, golfer_id: @bracket_golfer.golfer_id, integer: @bracket_golfer.integer }
    end

    assert_redirected_to bracket_golfer_path(assigns(:bracket_golfer))
  end

  test "should show bracket_golfer" do
    get :show, id: @bracket_golfer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bracket_golfer
    assert_response :success
  end

  test "should update bracket_golfer" do
    patch :update, id: @bracket_golfer, bracket_golfer: { bracket_id: @bracket_golfer.bracket_id, golfer_id: @bracket_golfer.golfer_id, integer: @bracket_golfer.integer }
    assert_redirected_to bracket_golfer_path(assigns(:bracket_golfer))
  end

  test "should destroy bracket_golfer" do
    assert_difference('BracketGolfer.count', -1) do
      delete :destroy, id: @bracket_golfer
    end

    assert_redirected_to bracket_golfers_path
  end
end
