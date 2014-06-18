daemon = TweetStream::Daemon.new('tracker', :log_output => true).track('#worldcup') do |tweet|
  daemon.on_inited do
    ActiveRecord::Base.connection.reconnect!
    ActiveRecord::Base.logger = Logger.new(File.open('log/stream.log', 'w+'))
    Tweet.create_from_tweet(tweet)
  end
end
