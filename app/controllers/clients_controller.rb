class ClientsController < ApplicationController
  # before_action :set_user_find, [:show, :edit, :destroy]

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find_by(user_id: current_user.id)
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to user_path(current_user.id), notice: 'クライアント情報が登録できました。'
    else
      redirect_to user_path(current_user.id), notice: 'クライアント情報が登録できませんでした。'
    end
  end

  def update
    client = Client.find_by(user_id: current_user.id)
    client.update(client_params)
    redirect_to user_path(current_user.id), notice: 'クライアント情報が更新されました。'
  end

  private
  def client_params
    params.require(:client).permit(:name, :hp_url, :prefecture_id, :postal_code, :city, :address, :phone_number).merge(user_id:current_user.id)
  end

  # def set_user_find
  #   @user = User.find(params[:id])
  # end

end
