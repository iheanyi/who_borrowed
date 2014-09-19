class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :destroy]

  def index
    @items = current_user.items
  end

  def new
    redirect_to root_url, alert: "Please login" unless signed_in?

    @item = Item.new
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Item successfully created!"
      redirect_to items_path
    else
      render 'new'
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    flash[:success] = "Item successfully destroyed!"
    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :image, :image_url)
    end
end
