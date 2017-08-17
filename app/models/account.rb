class Account
  def self.get_settings(base_url)
    settings = OneLogin::RubySaml::Settings.new

    base_url ||= "http://localhost:3000"

    # When disabled, saml validation errors will raise an exception.
    settings.soft = true

    #SP section
    settings.issuer                         = base_url + "/saml/metadata"
    settings.assertion_consumer_service_url = base_url + "/saml/consume"
    settings.assertion_consumer_logout_service_url = base_url + "/saml/logout"

    # IdP section
    identity_provider = IdentityProvider.find_by(requestor: base_url)
    settings.idp_entity_id                  = identity_provider.idp_entity_id
    settings.idp_sso_target_url             = identity_provider.idp_sso_target_url
    settings.idp_slo_target_url             = identity_provider.idp_slo_target_url
    settings.idp_cert                       = identity_provider.idp_cert
    # or settings.idp_cert_fingerprint           = "3B:05:BE:0A:EC:84:CC:D4:75:97:B3:A2:22:AC:56:21:44:EF:59:E6"
    #    settings.idp_cert_fingerprint_algorithm = XMLSecurity::Document::SHA1

    settings.name_identifier_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"

    # Security section
    settings.security[:authn_requests_signed] = false
    settings.security[:logout_requests_signed] = false
    settings.security[:logout_responses_signed] = false
    settings.security[:metadata_signed] = false
    settings.security[:digest_method] = XMLSecurity::Document::SHA1
    settings.security[:signature_method] = XMLSecurity::Document::RSA_SHA1

    settings
  end
end
