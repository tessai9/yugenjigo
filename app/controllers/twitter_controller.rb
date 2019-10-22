class TwitterController < ApplicationController
  before_action :authenticate_user!

  # twitter client variable
  @@client = Twitter::REST::Client.new do |config|
    config.consumer_key        = Rails.application.credentials.twitter_consumer_key
    config.consumer_secret     = Rails.application.credentials.twitter_consumer_secret
    config.access_token        = Rails.application.credentials.twitter_access_token
    config.access_token_secret = Rails.application.credentials.twitter_access_token_secret
  end

  # search tweets
  def index
    render :json => JSON.generate(@@client.search("#有言実GO -RT", lang: "ja", count: 8).to_h)
  end
end
