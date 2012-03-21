class PaymentsController < ApplicationController

  def paypal_ipn
    if request.method.eql?(:post)
      PaypalRecord.create(:params => params)
    end
    
    render :text => "OK"
  end
  
end
