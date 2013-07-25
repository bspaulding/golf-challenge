require 'test_helper'

class GolferAchievementsControllerTest < ActionController::TestCase
  setup do
    @golfer_achievement = golfer_achievements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:golfer_achievements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create golfer_achievement" do
    assert_difference('GolferAchievement.count') do
      post :create, golfer_achievement: { achievement_id: @golfer_achievement.achievement_id, golfer_id: @golfer_achievement.golfer_id }
    end

    assert_redirected_to golfer_achievement_path(assigns(:golfer_achievement))
  end

  test "should show golfer_achievement" do
    get :show, id: @golfer_achievement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @golfer_achievement
    assert_response :success
  end

  test "should update golfer_achievement" do
    patch :update, id: @golfer_achievement, golfer_achievement: { achievement_id: @golfer_achievement.achievement_id, golfer_id: @golfer_achievement.golfer_id }
    assert_redirected_to golfer_achievement_path(assigns(:golfer_achievement))
  end

  test "should destroy golfer_achievement" do
    assert_difference('GolferAchievement.count', -1) do
      delete :destroy, id: @golfer_achievement
    end

    assert_redirected_to golfer_achievements_path
  end
end
