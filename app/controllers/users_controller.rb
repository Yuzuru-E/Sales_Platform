class UsersController < ApplicationController

  def new
  end

  def show
    @user = User.find(current_user.id)
    if @user.image?
      @userImage = @user.image.to_s
    else
      @userImage = nil
    end
  end

end
