module Picpay
  
  module Seller
    
    attr_accessor :api_url, :picpay_token, :seller_token
    
    def data_seller
      seller = {
          "apiUrl": api_url,
          "picpayToken": picpay_token,
          "sellerToken": seller_token
      }
      seller
    end
    
  end

end
