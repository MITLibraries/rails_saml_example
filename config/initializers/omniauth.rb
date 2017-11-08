# At app startup, parse the IdP metadata and configure the SP.

idp_metadata_parser = OneLogin::RubySaml::IdpMetadataParser.new
idp_metadata = idp_metadata_parser.parse_remote_to_hash(
  ENV['IDP_METADATA_URL'],
  true, # validate cert
  entity_id: ENV['IDP_ENTITY_ID']
)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           idp_sso_target_url: idp_metadata[:idp_sso_target_url],
           idp_cert: idp_metadata[:idp_cert],
           idp_cert_fingerprint: idp_metadata[:idp_cert_fingerprint],
           certificate: Base64.strict_decode64(ENV['SP_CERTIFICATE']),
           private_key: Base64.strict_decode64(ENV['SP_PRIVATE_KEY']),
           request_attributes: {},
           issuer: ENV['SP_ENTITY_ID'],
           security: { authn_requests_signed: true,
                       want_assertions_signed: true,
                       metadata_signed: true,
                       digest_method: XMLSecurity::Document::SHA256,
                       signature_method: XMLSecurity::Document::RSA_SHA256 }
end
