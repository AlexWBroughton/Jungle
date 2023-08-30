class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_active_sale

  private

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def enhanced_cart
    @enhanced_cart ||= Product.where(id: cart.keys).map { |product| { product: product, quantity: cart[product.id.to_s] } }
  end
  helper_method :enhanced_cart

  def cart_subtotal_cents
    enhanced_cart.map { |entry| entry[:product].price_cents * entry[:quantity] }.sum
  end
  helper_method :cart_subtotal_cents

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

  def set_active_sale
    @active_sale = Sale.active.first
  end
  
end
