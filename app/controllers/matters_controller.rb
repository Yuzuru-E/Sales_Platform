class MattersController < ApplicationController
  before_action :set_current_client, only: [:new, :create, :edit, :update, :destroy, :ordered_index]
  before_action :set_current_client_ordered_matters, only: [:update, :ordered_index, :destroy]
  before_action :set_current_contractor, only: [:show, :decline, :recieved, :recieve_index]
  before_action :set_current_contractor_recieved_matters, only: [:decline, :recieve_index]
  before_action :set_matter_find, only: [:show, :edit, :update, :destroy, :recieved, :decline]

  def index
  end
  
  def new
    @matter = Matter.new
  end
  
  def edit
  end
  
  def update
    @matter.industry_id = current_user.industry_id
    @matter.update(matter_params)
    redirect_to ordered_index_matters_path, notice: '案件の更新が完了しました。'
  end
  
  def ordered_index
  end

  def recieved_index
  end

  def recieved
    @matter = Matter.find(8)
    @matter.update_attributes(contractor_id: @current_contractor.id,  order_date: Date.today)
    redirect_to matter_path(@matter.id), notice: '案件を1件受託しました。'
  end

  def show
    # @matter = Matter.find(8)
    # binding.pry
    @grandchild = Industry.find(@matter.industry_id)
    @child = @grandchild.parent
    @parent = @child.parent if @child
    period = (@matter.end_on - Date.today).to_i
    if period <= 0
      @period = "募集終了"
    else
      @period = period
    end

  end
  
  def create
    @matter = Matter.new(matter_params)
    @matter.industry_id = current_user.industry_id
    
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

  def decline
    @matter.update_attributes(contractor_id: nil, order_date: nil)
    redirect_to matter_path(@matter.id), notice: '案件を1件辞退いたしました。'
  end


  private

  def matter_params
    params.require(:matter).permit(:client_id, :title, :matter_content, :start_on, :end_on, :contract_period, :industry_id, :reward, :number_of_positions).merge(client_id:@current_client.id)
  end


  def set_matter_find
    @matter = Matter.find(params[:id])
  end

  def set_current_client_ordered_matters
    @matters = Matter.where(client_id: @current_client.id)
  end

  def set_current_contractor_recieved_matters
    @matters = Matter.where(contractor_id: @current_contractor_id)
  end

end
