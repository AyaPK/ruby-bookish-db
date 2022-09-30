class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:book).permit(:username, :forename, :surname, :avatar)
  end
end
