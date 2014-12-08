Rails.configuration.stripe = {
  :publishable_key => ENV.fetch('STRIPE_PUBLISHABLE_KEY','pk_test_LQMcoQgCNw4DnPmhuV1AVhRz'),
  :secret_key      => ENV.fetch('STRIPE_SECRET_KEY','sk_test_WRVkn5rgltWr8gTmlwooc5X1')
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
