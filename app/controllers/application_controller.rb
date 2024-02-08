class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :create_cart

  private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end

    def create_cart
      if !session[:cart_id]
        cart = Cart.create
        session[:cart_id] = cart.id
      end
    end

    def set_cart
      @cart = Cart.find(session[:cart_id])
    end
end
