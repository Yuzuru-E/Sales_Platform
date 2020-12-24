class UsersController < ApplicationController

  def new
  end

  def get_industry_children
    @industry_children = Industry.find(params[:parent_id]).children
  end

  def get_industry_grandchildren
    @industry_grandchildren = Industry.find(params[:child_id]).children
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
    @grandchild = Industry.find(@user.industry_id)
    @child = @grandchild.parent
    @parent = @child.parent if @child
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
