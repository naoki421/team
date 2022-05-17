class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total_price = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(params[:id])
      render "public/items/show"
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
  end

  def all_destroy
    current_customer.cart_items.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
