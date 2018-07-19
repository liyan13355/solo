class BraintreeController < ApplicationController
  def new

  	@client_token = Braintree::ClientToken.generate

  end

  def checkout
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  result = Braintree::Transaction.sale(
   :amount => params[:checkout_form][:amount], #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true
    }
   )

	  if result.success?
	    redirect_back fallback_location: new_user_path , :flash => { :success => "Transaction successful!" }
	  else
	    redirect_back fallback_location: new_user_path, :flash => { :error => "Transaction failed. Please try again." }
	  end
	end

end