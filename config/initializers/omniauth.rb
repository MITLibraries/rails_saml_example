idp_metadata_parser = OneLogin::RubySaml::IdpMetadataParser.new
idp_metadata = idp_metadata_parser.parse_remote_to_hash("https://touchstone.mit.edu/metadata/MIT-metadata.xml")

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           idp_sso_target_url: idp_metadata[:idp_sso_target_url],
           idp_cert: idp_metadata[:idp_cert],
           idp_cert_fingerprint: idp_metadata[:idp_cert_fingerprint],
           certificate: Base64.strict_decode64(ENV['CERTIFICATE']),
           private_key: Base64.strict_decode64(ENV['PRIVATE_KEY'])
end
