class RefererController < ApplicationController
  def index
    @declare = Declare.find(params[:id])
    @declared_user = User.find_by(uid: @declare.uid).username
  end
end
