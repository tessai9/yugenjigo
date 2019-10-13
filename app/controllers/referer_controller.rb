class RefererController < ApplicationController
  # display specified declare
  def show
    @declare = Declare.find(params[:id])
    @declared_user = User.find_by(@declare.uid).username
  end
end
