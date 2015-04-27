class Users::SpotsController < ApplicationController

  def new
    @user = current_user
  end

  def create
    @user = current_user
    @spot = current_user.spots.new(spot_params)
    if @spot.save
      flash[:notice] = "Spot saved"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Check the format of your lat and long"
      render :new
    end
  end

  def show
    respond_to do |format|
      format.json { render json: current_user.spots.last }
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:lat, :long, :rating, :avatar, :remote_avatar_url)
  end

end
