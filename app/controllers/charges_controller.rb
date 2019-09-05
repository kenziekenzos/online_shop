class ChargesController < ApplicationController

  def new
    total = @cart.total_price * 100
    @amount = total.to_i

  end

  def create
    # Amount in cents
    total = @cart.total_price * 100
    @amount = total.to_i

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

  charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    if charge["paid"] == true
        current_user.checkout
        puts "ok"
        UserNotifierMailer.send_confirmation_order(current_user).deliver
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end