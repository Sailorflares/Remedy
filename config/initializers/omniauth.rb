OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1491949827760019', 'e35b08e4b856c3b023cbb9d84c21692d'
end