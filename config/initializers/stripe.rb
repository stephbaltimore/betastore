Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_LQMcoQgCNw4DnPmhuV1AVhRz'],
  :secret_key      => ENV['sk_test_WRVkn5rgltWr8gTmlwooc5X1']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
