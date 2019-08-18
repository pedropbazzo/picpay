module Picpay
  
  module Buyer
    
    attr_accessor :first_name, :last_name, :document, :email, :phone
    
    def data_buyer
      buyer = {
          "firstName": first_name,
          "lastName": last_name,
          "document": format_document(document),
          "email": email,
          "phone": format_phone(phone)
      }
      buyer
    end
    
    private
    
    def format_document(number)
      # 123.456.789-10
      unless number.nil?
        if (number.size == 11)
          number.to_s.strip.gsub(/[^\d]/, '').sub(/(\d{3})(\d{3})(\d{3})(\d{2})/, "\\1.\\2.\\3-\\4") unless number.nil?
        else
          number.to_s.strip.gsub(/[^\d]/, '').sub(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/, "\\1.\\2.\\3/\\4-\\5") unless number.nil?
        end
      end
    end
    
    def format_phone(number)
      # +55 27 12345-6789
      unless number.nil?
        if (number.size == 17)
          number.to_s.strip.gsub(/[^\d]/, '').sub(/(\d{2})(\d{2})(\d{5})(\d{4})/, "+\\1 \\2 \\3-\\4")
        else
          number.to_s.strip.gsub(/[^\d]/, '').sub(/(\d{2})(\d{2})(\d{4})(\d{4})/, "+\\1 \\2 \\3-\\4")
        end
      end
    end
  
  end

end
