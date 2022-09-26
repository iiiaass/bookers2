class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
  def show
    @book=Book.new
    @books=Book.all
    @user=User.find(params[:id])
  end



  def index
    @book=Book.new
    @users=User.all

  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id),notice:'You have updated user successfully.'
    else
    render:edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def correct_user
    @user= User.find(params[:id])
    unless @user == current_user
    redirect_to users_path
    end
  end
end
