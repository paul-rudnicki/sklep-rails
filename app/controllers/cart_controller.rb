class CartController < ApplicationController
  def show
  end

  def edit
  end

  def confirmation
  end

  def add_product
    order = current_cart_or_create
    product = Product.find(params[:product_id])
    if item = order.line_items.where(product: product).first
      item.quantity += 1
      item.save
    else
      order.save
      order.line_items.create! product: product,
                              quantity: 1,
                              unit_price: product.price,
                              item_name: product.name
    end
    flash[:notice] = "Dodano produkt do koszyka"
    redirect_back(fallback_location: root_path)
  end

  def remove_product
    order = current_cart
    product = Product.find(params[:product_id])
    item = order.line_items.where(product: product).first
    if item
      item.destroy
    end
    redirect_to :back, notice: "Usunęto produkt z koszyka"
  end
end
