if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_JezaTNK1Ipf6e3Ib34aVtWUe',
    secret_key: 'sk_test_m0i4TrwjE2W4LpBnFJPeXH4h'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]