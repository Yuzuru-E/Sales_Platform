class MattersController < ApplicationController
  before_action :set_current_client, only: [:new, :create, :edit, :update, :destroy, :ordered_index]
  before_action :set_current_client_ordered_matters, only: [:ordered_index, :destroy]
  before_action :set_matter_find, only: [:show, :edit, :destroy]

  def index
  end
  
  def new
    @matter = Matter.new
  end
  
  def edit
  end
  
  def update
  end
  
  def ordered_index
  end

  def show
  end
  
  def create
    @matter = Matter.new(matter_params)
    @matter.industry_id = current_user.industry_id
    # sabun = (@matter.start_on - Date.today).to_i
    # unless sabun >= 1
    #   flash[:error] = "募集開始日は翌日以降を指定して下さい"
    #   render 'new'
    #   return
    # end
    
    # sabun = (@matter.end_on - @matter.start_on).to_i
    # unless sabun >= 0
    #   flash[:error] = "掲載終了日は開始日以降を指定して下さい"
    #   render 'new'
    #   return
    # end
    
    if @matter.save
      redirect_to user_path(current_user.id), notice: '案件登録が完了いたしました。'
    else
      redirect_to new_matter_path, notice: '案件が登録できませんでした'
    end
  end
  
  def destroy
    @matter.destroy
    redirect_to ordered_index_matters_path, notice: '発注済案件1件が削除されました。'
  end

  private

  def matter_params
    params.require(:matter).permit(:client_id, :title, :matter_content, :start_on, :end_on, :contract_period, :industry_id, :reward, :number_of_positions).merge(client_id:@current_client.id)
  end

  def set_matter_find
    @matter = Matter.find(params[:id])
  end
  
  def set_current_client
    @current_client = Client.find_by(user_id: current_user.id)
  end

  def set_current_client_ordered_matters
    @matters = Matter.where(client_id: @current_client.id)
  end

end
