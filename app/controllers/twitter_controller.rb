class TwitterController < ApplicationController

  def index
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
      config.access_token        = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end
    render :json => JSON.generate(@client.search("#有言実GO -RT", lang: "ja").first.text)
  end

end
