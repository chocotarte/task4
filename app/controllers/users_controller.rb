class UsersController < ApplicationController
  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index
    @user = current_user
    @users = User.all
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
