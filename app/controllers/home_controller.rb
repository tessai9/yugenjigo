class HomeController < ApplicationController
  def index
  end

  def login_check
    render :json => JSON.generate({ 'login_status' => user_signed_in? })
  end
end
