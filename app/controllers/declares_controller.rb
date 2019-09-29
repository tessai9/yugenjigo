class DeclaresController < ApplicationController
  before_action :authenticate_user!

  # today's declaration
  def index
    # search declaration
    @last_declare = Declare.where(uid: current_user.uid, created_at: Time.zone.today.beginning_of_day...Time.zone.today.end_of_day).first

    # make json as response
    if @last_declare
      # exist
      render :json => JSON.generate({ :exist => true, :declaration_id => @last_declare.id, :todays_declare => @last_declare.declare, :done => @last_declare.done })
    else
      # not exist
      render :json => JSON.generate({ :exist => false })
    end
  end

  # make declaration
  def create
    @new_declare = Declare.new do |declaration|
      declaration.uid = current_user.uid
      declaration.declare = params[:content]
    end

    render :json => JSON.generate({ :registered => @new_declare.save })
  end

  # update completed declaration
  def update
    @target_declaration = Declare.find(params[:declaration_id])

    render :json => JSON.generate({ :updated => @target_declaration.update(done: true) })
  end

  private

  # permit parameter
  def posted_declare
    params.require(:declares).permit(:declare, :declaration_id)
  end
end
