#$redis = Redis.new(:driver => :hiredis) 
uri = URI.parse(ENV["redis://redistogo:b85e09a83b93927afc85322a6bbd4540@grouper.redistogo.com:10744/"])
REDIS = Redis.new(:url => uri)
