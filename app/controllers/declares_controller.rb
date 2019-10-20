class DeclaresController < ApplicationController
  before_action :authenticate_user!, except: [:reactions, :countup]

  # today's declaration
  def index
    # search declaration
    @last_declare = Declare.where(uid: current_user.uid, created_at: Time.zone.today.beginning_of_day...Time.zone.today.end_of_day).first

    # make json as response
    if @last_declare
      # exist
      render :json => JSON.generate({ :exist => true, :user_id => @last_declare.uid ,:declaration_id => @last_declare.id, :todays_declare => @last_declare.declare, :done => @last_declare.done })
    else
      # not exist
      render :json => JSON.generate({ :exist => false })
    end
  end

  def reactions
    # seach specified declaration
    @declare = Declare.find(params[:id])

    # check whose declaration
    @isYours = if current_user.nil?
                 false
               elsif
                 @declare.uid == current_user.uid
               end

    render :json => JSON.generate({ :your_declaration => @isYours, :cheered => @declare.cheered })
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

  # count up cheered
  def countup
    @target_declaration = Declare.find(params[:declaration_id])

    render :json => JSON.generate({ :updated => @target_declaration.update(done: params[:count]) })
  end

  private

  # permit parameter
  def posted_declare
    params.require(:declares).permit(:declare, :declaration_id, :count)
  end
end
