require 'date'

module Picpay
  
  module Payment
    
    attr_accessor :reference_id, :callback_url, :return_url, :value, :expires_at
    
    def data_payment
      payment = {
          "referenceId": reference_id,
          "callbackUrl": callback_url,
          "returnUrl": return_url,
          "value": value,
          "expiresAt": format_date(expires_at),
          "buyer": data_buyer,
      }
      payment
    end
    
    private
    
    def format_date(date)
      DateTime.parse(date).iso8601(9)
    end
    
  end

end
