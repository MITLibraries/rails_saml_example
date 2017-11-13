# Environment Variables

`IDP_METADATA_URL` - URL from which the IDP metadata can be obtained. This is
  loaded at application start to ensure it remains up to date.

`IDP_ENTITY_ID` - If `IDP_METADATA_URL` returns more than one IdP (like MIT
  does) entry, this setting signifies which IdP to use.

`IDP_SSO_URL` - the URL from the IdP metadata to use for authentication. I was
  unable to extract this directly from the metadata with the ruby-saml tool
  even though it for sure exists.

`SP_ENTITY_ID` - unique identifier to this application,
  ex: `https://example.com/shibboleth`

`SP_PRIVATE_KEY` - Base64 strict encoded version of the SP Private Key.
  note: Base64 is required due to multiline ENV being weird to deal with.

`SP_CERTIFICATE` - Base64 strict encoded version of the SP Certificate.
  note: Base64 is required due to multiline ENV being weird to deal with.

`URN_EMAIL` - URN to extract from SAML response. For MIT, `urn:oid:0.9.2342.19200300.100.1.3` for testshib `urn:oid:1.3.6.1.4.1.5923.1.1.1.6` is close enough for testing.

`URN_NAME` - `urn:oid:2.16.840.1.113730.3.1.241` for MIT, `urn:oid:2.5.4.3` for testshib

`URN_UID` - `urn:oid:1.3.6.1.4.1.5923.1.1.1.6` should be good enough for both MIT and testshib. However, it is not guaranteed to be forever unique but MIT does not provide a truly unique option so this is the best we've got.
