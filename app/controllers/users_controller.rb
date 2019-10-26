class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def deliver_address
    @deliver_address = DeliverAddress.new
  end
end
