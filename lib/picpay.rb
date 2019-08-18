require 'picpay/version'

require 'picpay/seller'
require 'picpay/buyer'
require 'picpay/payment'
require 'picpay/request'

module Picpay
  class Picpay
    
    include Seller, Buyer, Payment, Request
    
    def initialize(picpay_token, seller_token, api_url = nil)
      self.picpay_token = picpay_token
      self.seller_token = seller_token
      self.api_url = api_url.nil? ? API_ENDPOINT : api_url
    end
  end
  
  class Error < StandardError;
  end
end
