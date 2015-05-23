#$redis = Redis.new(:driver => :hiredis)

uri = URI.parse(ENV["REDISTOGO_URL"])
$redis = Redis.new(:url => uri)
