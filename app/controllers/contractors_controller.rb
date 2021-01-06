class ContractorsController < ApplicationController

  def new
    @contractor = Contractor.new
  end
  
  def edit
    @contractor = Contractor.find_by(user_id: current_user.id)
  end

  def create
    @contractor = Contractor.new(contractor_params)
    if @contractor.save
      redirect_to user_path(current_user.id), notice: '受託者情報が登録できました。'
    else
      redirect_to user_path(current_user.id), notice: '受託者情報が登録できませんでした。'
    end
  end
  
  def update
    contractor = Contractor.find_by(user_id: current_user.id)
    contractor.update(contractor_params)
    redirect_to user_path(current_user.id), notice: 'ランサー情報が更新されました。'
  end

  private
  def contractor_params
    params.require(:contractor).permit(:gender_id, :operating_id, :suggested_price).merge(user_id:current_user.id)
  end
end
