class UserController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
     if @user.save
        log_in @user
        redirect_to @user, notice: 'user successfully created.'
      else
        render :new, danger: 'user was not created.'
      end
  end

  
  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :name, :lastname, :password, :picture)
    end

end
