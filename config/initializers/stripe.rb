#Rails.configuration.stripe do |config|
#  config.publishable.key = ENV['STRIPE_PUBLISHABLE_KEY'] ||= Rails.application.secrets.stripe_publishable_key
#  config.secret.key = ENV['STRIPE_SECRET_KEY'] ||= Rails.application.secrets.stripe_secret_key
#end
#
#DO NOT USE: 
#Stripe.api_key = Rails.configuration.stripe.secret_key

Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key => ENV['STRIPE_SECRET_KEY'],
}

#
#DO NOT USE:
# Stripe.api_key = ENV['STRIPE_SECRET_KEY']
#Rails.configuration.stripe[:secret_key]
