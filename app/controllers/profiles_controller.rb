class ProfilesController < ApplicationController

  def show
    @user = current_user
    @profile = @user.profile
  end

  def update
    @user = current_user
    @profile = @user.profile
    if @user
      @profile.update(profile_params)
      @profile.save
      flash[:notice] = "Successfully Updated"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Something went wrong :("
      redirect_to :back
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:bio, :user_id)
  end
end
