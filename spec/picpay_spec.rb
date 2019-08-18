RSpec.describe Picpay do
  it "has a version number" do
    expect(Picpay::VERSION).to be_truthy
  end
  
  it "setup picpay" do
    picpay_token = '5b008cef7f321d00ef2367b2'
    seller_token = '4ef4edbd-5cda-42da-860b-0e8d7b90c784'
    api_url = 'https://appws.picpay.com/ecommerce/public/payments' # optional
  
    picpay = Picpay::Picpay.new(picpay_token, seller_token)
  
    expect(picpay).to be_truthy
  end

end
