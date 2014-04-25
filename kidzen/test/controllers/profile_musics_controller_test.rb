require 'test_helper'

class ProfileMusicsControllerTest < ActionController::TestCase
  setup do
    @profile_music = profile_musics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_musics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_music" do
    assert_difference('ProfileMusic.count') do
      post :create, profile_music: { mp3_url: @profile_music.mp3_url, user_id: @profile_music.user_id, youtube_url: @profile_music.youtube_url }
    end

    assert_redirected_to profile_music_path(assigns(:profile_music))
  end

  test "should show profile_music" do
    get :show, id: @profile_music
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_music
    assert_response :success
  end

  test "should update profile_music" do
    patch :update, id: @profile_music, profile_music: { mp3_url: @profile_music.mp3_url, user_id: @profile_music.user_id, youtube_url: @profile_music.youtube_url }
    assert_redirected_to profile_music_path(assigns(:profile_music))
  end

  test "should destroy profile_music" do
    assert_difference('ProfileMusic.count', -1) do
      delete :destroy, id: @profile_music
    end

    assert_redirected_to profile_musics_path
  end
end
