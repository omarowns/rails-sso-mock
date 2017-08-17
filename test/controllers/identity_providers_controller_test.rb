require 'test_helper'

class IdentityProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @identity_provider = identity_providers(:one)
  end

  test "should get index" do
    get identity_providers_url
    assert_response :success
  end

  test "should get new" do
    get new_identity_provider_url
    assert_response :success
  end

  test "should create identity_provider" do
    assert_difference('IdentityProvider.count') do
      post identity_providers_url, params: { identity_provider: { idp_cert: @identity_provider.idp_cert, idp_cert_fingerprint: @identity_provider.idp_cert_fingerprint, idp_cert_fingerprint_algorithm: @identity_provider.idp_cert_fingerprint_algorithm, idp_entity_id: @identity_provider.idp_entity_id, idp_slo_target_url: @identity_provider.idp_slo_target_url, idp_sso_target_url: @identity_provider.idp_sso_target_url, name: @identity_provider.name } }
    end

    assert_redirected_to identity_provider_url(IdentityProvider.last)
  end

  test "should show identity_provider" do
    get identity_provider_url(@identity_provider)
    assert_response :success
  end

  test "should get edit" do
    get edit_identity_provider_url(@identity_provider)
    assert_response :success
  end

  test "should update identity_provider" do
    patch identity_provider_url(@identity_provider), params: { identity_provider: { idp_cert: @identity_provider.idp_cert, idp_cert_fingerprint: @identity_provider.idp_cert_fingerprint, idp_cert_fingerprint_algorithm: @identity_provider.idp_cert_fingerprint_algorithm, idp_entity_id: @identity_provider.idp_entity_id, idp_slo_target_url: @identity_provider.idp_slo_target_url, idp_sso_target_url: @identity_provider.idp_sso_target_url, name: @identity_provider.name } }
    assert_redirected_to identity_provider_url(@identity_provider)
  end

  test "should destroy identity_provider" do
    assert_difference('IdentityProvider.count', -1) do
      delete identity_provider_url(@identity_provider)
    end

    assert_redirected_to identity_providers_url
  end
end
