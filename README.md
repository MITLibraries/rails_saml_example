# Environment Variables

`IDP_METADATA_URL` - URL from which the IDP metadata can be obtained. This is
  loaded at application start to ensure it remains up to date.

`IDP_ENTITY_ID` - If `IDP_METADATA_URL` returns more than one IdP (like MIT
   does) entry, this setting signifies which IdP to use.

`SP_ENTITY_ID` - unique identifier to this application,
  ex: `https://example.com/shibboleth`

`SP_PRIVATE_KEY` - Base64 strict encoded version of the SP Private Key.
  note: Base64 is required due to multiline ENV being weird to deal with.

`SP_CERTIFICATE` - Base64 strict encoded version of the SP Certificate.
  note: Base64 is required due to multiline ENV being weird to deal with.
