require 'test_helper'

class AisAttributesControllerTest < ActionController::TestCase
  setup do
    @ais_attribute = ais_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ais_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ais_attribute" do
    assert_difference('AisAttribute.count') do
      post :create, ais_attribute: { application_number: @ais_attribute.application_number, application_term: @ais_attribute.application_term, attribute: @ais_attribute.attribute, banner_pidm: @ais_attribute.banner_pidm }
    end

    assert_redirected_to ais_attribute_path(assigns(:ais_attribute))
  end

  test "should show ais_attribute" do
    get :show, id: @ais_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ais_attribute
    assert_response :success
  end

  test "should update ais_attribute" do
    put :update, id: @ais_attribute, ais_attribute: { application_number: @ais_attribute.application_number, application_term: @ais_attribute.application_term, attribute: @ais_attribute.attribute, banner_pidm: @ais_attribute.banner_pidm }
    assert_redirected_to ais_attribute_path(assigns(:ais_attribute))
  end

  test "should destroy ais_attribute" do
    assert_difference('AisAttribute.count', -1) do
      delete :destroy, id: @ais_attribute
    end

    assert_redirected_to ais_attributes_path
  end
end
