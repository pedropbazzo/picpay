require 'faraday'
require_relative 'seller'

module Picpay
  
  module Request
    
    include Seller
    
    attr_accessor :authorization_id
    
    def headers
      header = {
          'Content-Type' => 'application/json',
          'x-picpay-token' => picpay_token,
      }
    end
    
    def headers_seller
      header = {
          'Content-Type' => 'application/json',
          'x-seller-token' => seller_token,
      }
    end
    
    def payments
      begin
        response = Faraday.post(api_url, data_payment, headers)
        response
      rescue Faraday::Error::ConnectionFailed => error
        error.message.inspect
      end
    end
    
    def payments_cancellations(reference_id, authorization_id)
      begin
        url = "#{api_url}/#{reference_id}/cancellations"
        response = Faraday.post(url, {authorizationId: authorization_id}, headers)
        response
      rescue Faraday::Error::ConnectionFailed => error
        error.message.inspect
      end
    end
    
    def payments_status(reference_id)
      begin
        url = "#{api_url}/#{reference_id}/status"
        response = Faraday.get(url, headers)
        response
      rescue Faraday::Error::ConnectionFailed => error
        error.message.inspect
      end
    end
  
  end

end
