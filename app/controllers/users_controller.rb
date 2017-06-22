class UsersController < ApplicationController
  def index
    if signed_in?
      redirect_to new_flower_path
    else
      render text: "error"
    end
  end

  def show
    # show
  end

  def create
    @user = User.create(u_params)
    if @user.errors.empty?
      redirect_to users_path(@user)
    else
      render text: "Ошибка, проверьте правильность ввода данных"
    end
  end

  def update
    # update
  end

  def destroy
    # destroy
  end

  private

    def u_params
      params.require(:user).permit(:email, :password, :role)
    end
end
