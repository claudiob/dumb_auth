Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, fields: [:email]
  provider :twitter, "EH3dyViLSPugtMyigYeAfw", "fs2Diy6xrG3C45uQp6O2e4iZMIFHkZZfgVirP92BZk"
end