class AdvertisementsController < ApplicationController
  before_action :set_current_client, only: [:new, :create, :edit, :update, :destroy, :registration_index]
  before_action :set_advertisement_find, only: [:show, :edit, :update, :destroy]
  before_action :set_registration_advertisement, only: [:update, :registration_index, :destroy]

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.industry_id = current_user.industry_id
    
    if @advertisement.save
      redirect_to user_path(current_user.id), notice: '広告登録が1件完了いたしました。'
    else
      redirect_to new_advertisement_path, notice: '広告が登録できませんでした'
    end
  end

  def edit
  end

  def update
    @advertisement.update(advertisement_params)
    redirect_to registration_index_advertisements_path, notice: '広告の更新が完了しました。'
  end

  def registration_index
  end

  def destroy
    @advertisement.destroy
    redirect_to registration_index_advertisements_path, notice: '投稿した広告が1件削除されました。'
  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:title, :start_on, :end_on, :banner_image, :banner_url).merge(client_id:@current_client.id)
  end

  def set_advertisement_find
    @advertisement = Advertisement.find(params[:id])
  end

  def set_registration_advertisement
    @advertisements = Advertisement.where(client_id: @current_client.id)
  end

end
