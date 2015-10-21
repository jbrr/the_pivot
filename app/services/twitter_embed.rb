class TwitterEmbed
  include HTTParty

  def embedded_tweet(tweet_uri)
    self.class.get("https://api.twitter.com/1/statuses/oembed.json?url=#{tweet_uri}")
  end
end
