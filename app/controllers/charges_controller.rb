class ChargesController < ApplicationController
  def new
    # this will remain empty unless you need to set some instance variables to pass on
  end
 
  def create
    # Amount in cents
    @amount = params[:stripeAmount].to_i * 100

    #fetch the customer 
#    customer = Stripe::Customer.retrieve(stripe_card_token)
    #Retrieve the card fingerprint using the stripe_card_token 
    # Create the customer in Stripe
#    card_fingerprint = Stripe::Token.retrieve(stripe_card_token).try(:card).try(:fingerprint) 

    customer = Stripe::Customer.create({
   # check whether a card with that fingerprint already exists 
      email: params[:stripeEmail],  
#      default_card = customer.cards.all.data.select{|card| card.fingerprint == card_fingerprint}.last
 #       if card_fingerprint == card: params[:stripeToken]
        #create new card if it does not already exist
#          default_card = customer.cards.create({:card => stripe_card_token}) unless default_card
    #set the default card of the customer to be this card, as this is the last card provided by User and probably he want this card to be used for 
    #further transactions # Create the charge using the customer data returned by Stripe API
#          customer.default_card = default_card.id)

    charge = Stripe::Charge.create(
      :customer => customer.id, 
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd',
      customer.save
    )
 
    # place more code upon successfully creating the charge
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
    flash[:notice] = "Please try again"
  end
end
