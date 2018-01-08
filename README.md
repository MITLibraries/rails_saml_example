# Environment Variables

`IDP_METADATA_URL` - URL from which the IDP metadata can be obtained. This is
  loaded at application start to ensure it remains up to date.
  - MIT: `https://touchstone.mit.edu/metadata/MIT-metadata.xml`
  - Testshib: `http://www.testshib.org/metadata/testshib-providers.xml`

`IDP_ENTITY_ID` - If `IDP_METADATA_URL` returns more than one IdP (like MIT
  does) entry, this setting signifies which IdP to use.
  - MIT: `https://idp.mit.edu/shibboleth`
  - Testshib: `https://idp.testshib.org/idp/shibboleth`

`IDP_SSO_URL` - the URL from the IdP metadata to use for authentication. I was
  unable to extract this directly from the metadata with the ruby-saml tool
  even though it for sure exists.
  - MIT: `https://idp.mit.edu/idp/profile/SAML2/Redirect/SSO`
  - Testshib: `https://idp.testshib.org/idp/profile/SAML2/Redirect/SSO`

`SP_ENTITY_ID` - unique identifier to this application,
  - ex: `https://YOURAPP.mit.edu/saml`
  - MIT prefers this to be something in the .mit.edu domain even if your
  app will run on a non-mit.edu domain. Therefore, you should register or
  reserve an mit.edu domain for your app.

`SP_PRIVATE_KEY` - Base64 strict encoded version of the SP Private Key.
  note: Base64 is required due to multiline ENV being weird to deal with.
  - [See generation notes](https://mitlibraries.github.io/touchstone_saml.html#generating-a-self-signed-certificate-for-touchstone)

`SP_CERTIFICATE` - Base64 strict encoded version of the SP Certificate.
  note: Base64 is required due to multiline ENV being weird to deal with.
  - [See generation notes](https://mitlibraries.github.io/touchstone_saml.html#generating-a-self-signed-certificate-for-touchstone)

`URN_EMAIL` - URN to extract from SAML response.
  - MIT: `urn:oid:0.9.2342.19200300.100.1.3`
  - Testshib `urn:oid:1.3.6.1.4.1.5923.1.1.1.6` is close enough for testing.

`URN_NAME`
  - MIT: `urn:oid:2.16.840.1.113730.3.1.241`
  - Testshib: `urn:oid:2.5.4.3`

`URN_UID`
  - MIT and Testshib: `urn:oid:1.3.6.1.4.1.5923.1.1.1.6` should be good enough.
  - However, it is not guaranteed to be forever unique but MIT does not provide a truly unique option so this is the best we've got.
