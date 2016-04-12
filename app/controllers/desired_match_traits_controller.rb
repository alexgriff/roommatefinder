class DesiredMatchTraitsController < ApplicationController
  before_action :authorize, only: [:edit, :update]

  def edit
    @user = User.find(params[:user_id])
    @action = user_desired_match_trait_path(@user, @user.desired_match_trait)
    @method = "PATCH"
  end

  def update
    @user = User.find(params[:user_id])
    desired_match_trait = @user.desired_match_trait

    if @user.update(extra_params) && desired_match_trait.update(desired_match_params)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.to_a + desired_match_trait.errors.to_a
      @action = user_desired_match_trait_path(@user, desired_match_trait)
      @method = "PATCH"
      render :edit
    end
  end

  def show
  end

private

    def extra_params
      params.require(:user).permit(:dealbreakers, :max_rent, :has_apartment)
    end

    def desired_match_params
      params.require(:user).permit(:desired_match_trait_attributes => [:gender, :move_in_date, :min_age, :max_age, :city])[:desired_match_trait_attributes]
    end

end