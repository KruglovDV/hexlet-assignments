# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    redirect_to new_user_path unless current_user
    flash[:notice] = t('.require_activation') unless current_user.active?
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.send_activation_email

      sign_in @user
      redirect_to @user, notice: t('.waiting_confirmation')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirm
    redirect_to :new unless params[:confirmation_token]

    # BEGIN
    @user = User.find_by(confirmation_token: params[:confirmation_token])

    if @user && @user.may_activate?
      @user.activate!
      redirect_to :root, notice: t('.activated')
    else
      redirect_to :root, notice: t('.activate_problems')
    end
    # END
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
