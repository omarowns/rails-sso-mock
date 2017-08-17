json.extract! identity_provider, :id, :name, :idp_entity_id, :idp_sso_target_url, :idp_slo_target_url, :idp_cert, :idp_cert_fingerprint, :idp_cert_fingerprint_algorithm, :created_at, :updated_at
json.url identity_provider_url(identity_provider, format: :json)
