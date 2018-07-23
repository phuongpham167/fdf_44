class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)
  before_action :correct_user, only: %i(edit update)

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      sign_in(@user, bypass: true)
      flash[:success] = t "users.edit.profile_updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def correct_user
    redirect_to root_path unless @user == current_user
  end

  def load_user
    @user = User.find_by(id: params[:id]) || not_found
  end

  def user_params
    params.require(:user).permit :name, :password,
      :password_confirmation, :phone_number, :address, :avatar
  end
end
