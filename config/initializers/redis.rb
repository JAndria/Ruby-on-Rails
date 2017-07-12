if Rails.env.production?
  $redis = Redis.new(url: ENV["REDIS_URL"])
else
  $redis = Redis.new(host: $IP, port: 6379)
end