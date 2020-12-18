class UsersController < ApplicationController

  def new
  end

  def show
    @client = Client.find_by(user_id: current_user.id)
    @contractor = Contractor.find_by(user_id: current_user.id)
    @user = User.find(current_user.id)
    if @user.profile_image?
      @userImage = @user.profile_image.to_s
    else
      @userImage = nil
    end
  end

  def edit
    @user = User.find(current_user.id)
    if @user.profile_image?
      @userImage = @user.profile_image.to_s
    else
      @userImage = nil
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id), notice: 'ユーザー情報が更新されました。'
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :contact_mail, :profile, :profile_image, :industry_id)
  end
  
end
