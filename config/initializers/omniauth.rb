Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'1643888345868772','91a1fc735691bdddba3a2fdd27c68ca4',
           :scope => 'email', :display => 'popup'
end