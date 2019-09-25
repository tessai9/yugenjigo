class DeclaresController < ApplicationController
  before_action :authenticate_user!

  # search today's declaration
  def index
    @last_declare = Declare.where(uid: current_user.uid, created_at: Time.zone.today.beginning_of_day...Time.zone.today.end_of_day).first

    # make json as response
    if @last_declare
      render :json => JSON.generate({ :exist => true, :last_declare => @last_declare.declare, :done => @last_declare.done })
    else
      render :json => JSON.generate({ :exist => false })
    end
  end

  # make declaration
  def create
    @new_declare = Declare.new do |declaration|
      declaration.uid = current_user.uid
      declaration.declare = posted_declare.declare
    end
    if @new_declare.save
      redirect_to controller: 'home'
    else
      render 'post_error'
    end
  end

  private

  # permit parameter
  def posted_declare
    params.require(:declares).permit(:declare)
  end
end
