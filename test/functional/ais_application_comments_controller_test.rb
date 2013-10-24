require 'test_helper'

class AisApplicationCommentsControllerTest < ActionController::TestCase
  setup do
    @ais_application_comment = ais_application_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ais_application_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ais_application_comment" do
    assert_difference('AisApplicationComment.count') do
      post :create, ais_application_comment: { application_number: @ais_application_comment.application_number, application_term: @ais_application_comment.application_term, banner_pidm: @ais_application_comment.banner_pidm, comment: @ais_application_comment.comment, originator: @ais_application_comment.originator }
    end

    assert_redirected_to ais_application_comment_path(assigns(:ais_application_comment))
  end

  test "should show ais_application_comment" do
    get :show, id: @ais_application_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ais_application_comment
    assert_response :success
  end

  test "should update ais_application_comment" do
    put :update, id: @ais_application_comment, ais_application_comment: { application_number: @ais_application_comment.application_number, application_term: @ais_application_comment.application_term, banner_pidm: @ais_application_comment.banner_pidm, comment: @ais_application_comment.comment, originator: @ais_application_comment.originator }
    assert_redirected_to ais_application_comment_path(assigns(:ais_application_comment))
  end

  test "should destroy ais_application_comment" do
    assert_difference('AisApplicationComment.count', -1) do
      delete :destroy, id: @ais_application_comment
    end

    assert_redirected_to ais_application_comments_path
  end
end
