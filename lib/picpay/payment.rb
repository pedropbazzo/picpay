module Picpay
  
  module Payment
    
    attr_accessor :reference_id, :callback_url, :return_url, :value, :expires_at, :buyer
    
    def data_payment
      payment = {
          "referenceId": reference_id,
          "callbackUrl": callback_url,
          "returnUrl": return_url,
          "value": value,
          "expiresAt": expires_at,
          "buyer": buyer,
      }
      payment
    end
    
  end

end
