module Picpay
  
  module Buyer
    
    attr_accessor :first_name, :last_name, :document, :email, :phone
    
    def data_buyer
      buyer = {
          "firstName": first_name,
          "lastName": last_name,
          "document": document,
          "email": email,
          "phone": phone
      }
      buyer
    end
    
  end

end
