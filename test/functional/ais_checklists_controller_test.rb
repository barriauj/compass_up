require 'test_helper'

class AisChecklistsControllerTest < ActionController::TestCase
  setup do
    @ais_checklist = ais_checklists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ais_checklists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ais_checklist" do
    assert_difference('AisChecklist.count') do
      post :create, ais_checklist: { application_number: @ais_checklist.application_number, application_term: @ais_checklist.application_term, banner_pidm: @ais_checklist.banner_pidm, ckst_code: @ais_checklist.ckst_code, item: @ais_checklist.item, item_description: @ais_checklist.item_description, mandatory: @ais_checklist.mandatory, received_date: @ais_checklist.received_date, requirement_code: @ais_checklist.requirement_code }
    end

    assert_redirected_to ais_checklist_path(assigns(:ais_checklist))
  end

  test "should show ais_checklist" do
    get :show, id: @ais_checklist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ais_checklist
    assert_response :success
  end

  test "should update ais_checklist" do
    put :update, id: @ais_checklist, ais_checklist: { application_number: @ais_checklist.application_number, application_term: @ais_checklist.application_term, banner_pidm: @ais_checklist.banner_pidm, ckst_code: @ais_checklist.ckst_code, item: @ais_checklist.item, item_description: @ais_checklist.item_description, mandatory: @ais_checklist.mandatory, received_date: @ais_checklist.received_date, requirement_code: @ais_checklist.requirement_code }
    assert_redirected_to ais_checklist_path(assigns(:ais_checklist))
  end

  test "should destroy ais_checklist" do
    assert_difference('AisChecklist.count', -1) do
      delete :destroy, id: @ais_checklist
    end

    assert_redirected_to ais_checklists_path
  end
end
