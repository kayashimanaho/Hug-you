class Public::AddressesController < ApplicationController
   before_action :authenticate_user!
  def index
    @address = Address.new
    @users = Address.all
    @addresses = current_user.addresses
  end

  def edit
   
    @address = Address.find(params[:id])
  end

  def create
     @address = Address.new(address_params)
     @address.user_id = current_user.id
    @address.save
    redirect_to addresses_path 
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
     redirect_to addresses_path(@address.id)
  end

  def destroy
     @addresses = Address.find(params[:id])
      @addresses.destroy
      redirect_to addresses_path
    
  end
  
  private

def address_params
     params.require(:address).permit(:user_id,:name,:postal_code,:address)
end
end
