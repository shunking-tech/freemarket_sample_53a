class Users::DeliverAddressesController < ApplicationController

  def show
    @deliver_address = current_user.deliver_address ? current_user.deliver_address : DeliverAddress.new
  end

  def new
    @deliver_address = DeliverAddress.new
  end

  def create
    @deliver_address = DeliverAddress.new(deliver_address_params)
    if @deliver_address.save
      redirect_to action: "show"
    else
      render :show
    end
  end

  def update
    @deliver_address = DeliverAddress.find(params[:id])
    if @deliver_address.update(deliver_address_params)
      redirect_to action: "show"
    else
      render :show
    end
  end

  private

  def deliver_address_params
    params.require(:deliver_address).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :zipcode,
      :prefecture_id,
      :city,
      :house_address,
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id)
  end
end
