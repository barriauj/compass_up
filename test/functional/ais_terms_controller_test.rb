require 'test_helper'

class AisTermsControllerTest < ActionController::TestCase
  setup do
    @ais_term = ais_terms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ais_terms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ais_term" do
    assert_difference('AisTerm.count') do
      post :create, ais_term: { effective_on: @ais_term.effective_on, fall: @ais_term.fall, spring: @ais_term.spring, summer: @ais_term.summer }
    end

    assert_redirected_to ais_term_path(assigns(:ais_term))
  end

  test "should show ais_term" do
    get :show, id: @ais_term
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ais_term
    assert_response :success
  end

  test "should update ais_term" do
    put :update, id: @ais_term, ais_term: { effective_on: @ais_term.effective_on, fall: @ais_term.fall, spring: @ais_term.spring, summer: @ais_term.summer }
    assert_redirected_to ais_term_path(assigns(:ais_term))
  end

  test "should destroy ais_term" do
    assert_difference('AisTerm.count', -1) do
      delete :destroy, id: @ais_term
    end

    assert_redirected_to ais_terms_path
  end
end
