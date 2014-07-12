class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def new
    redirect_to root_url, alert: "Please login" unless signed_in?

    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Item successfully created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    flash[:success] = "Item successfully destroyed!"
    redirect_to root_url
  end

  def edit
  end


  private
    def item_params
      params.require(:item).permit(:name)
    end
end
