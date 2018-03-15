OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '291055747865-mi2a1boilvghgvpprok29454c0e2d6b1.apps.googleusercontent.com', 'wP46qRjCrGwOPlQEDL3F6QH9', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end