class ChargesController < ApplicationController

  def new
    @stripe_btn_data = {
       key: "#{ Rails.configuration.stripe[:publishable_key] }",
       description: "Blocipedia Membership - #{current_user.name}",
       amount: 1500
     }
  end

  def create
    # Amount in cents
    @amount = 1500

   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

  current_user.update_attribute(:role, 'premium')
  current_user.save!
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @amount,
     description: "Blocipedia Membership - #{current_user.email}",
     currency: 'usd'
   )

    # if current_user.update(role: 'premium')
  flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
  redirect_to root_path
    # else
    #   flash[:error] = "There was an error upgrading your account. Please contact support!"
    #   redirect_to edit_user_registration_path 
    # end
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end
end
