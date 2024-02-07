class PaymentsController < ApplicationController
  before_action :set_cart, only: %i[checkout success]

  def checkout
    redirect_to carts_path and return if @cart.line_items.empty?
    line_items = []

    @cart.line_items.each do |line_item|
      line_items << {
        price_data: {
          unit_amount: line_item.product.price,
          currency: 'jpy',
          product_data: {
            name: line_item.product.name,
            description: line_item.product.description,
          }
        },
        quantity: line_item.quantity,
      }
    end

    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: line_items,
      mode: 'payment',
      success_url: payments_success_url,
      cancel_url: carts_url,
    })
  end

  def success
    @cart.line_items.destroy_all
    redirect_to root_path, notice: 'ご購入いただきありがとうございます!'
  end
end
