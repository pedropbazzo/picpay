# PicPay - E-commerce Public API

[![Gem Version](https://badge.fury.io/rb/picpay.svg)](https://badge.fury.io/rb/picpay)
[![Build Status](https://travis-ci.org/gilcierweb/picpay.svg?branch=master)](https://travis-ci.org/gilcierweb/picpay)
[![Maintainability](https://api.codeclimate.com/v1/badges/8ae01e6d34f3aaf85132/maintainability)](https://codeclimate.com/github/gilcierweb/picpay/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/8ae01e6d34f3aaf85132/test_coverage)](https://codeclimate.com/github/gilcierweb/picpay/test_coverage)

PicPay é o app que faz com que seus pagamentos sejam mais simples e rápidos, do jeito que você precisa. Com o PicPay você recebe e envia dinheiro para outras pessoas, paga contas, estabelecimentos, compra créditos para o celular e muito mais. Tudo isso na hora, direto do seu celular.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'picpay'

# or
gem 'picpay', :git => 'https://github.com/gilcierweb/picpay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install picpay

## Usage


```ruby

# Seller
picpay_token = '5b008cef7f321d00ef2367b2'
seller_token = '4ef4edbd-5cda-42da-860b-0e8d7b90c784'
api_url = 'https://appws.picpay.com/ecommerce/public/payments' # optional

picpay = Picpay::Picpay.new(picpay_token, seller_token)

# Buyer
picpay.first_name = 'Fulano'
picpay.last_name = 'Da Silva Sousa'
picpay.document = '123.456.789-10'
picpay.email = 'teste@gilcierweb.com.br'
picpay.phone = '+55 85 12345-6789'

# Payment
picpay.reference_id = '102030'
picpay.callback_url = 'http://www.sualoja.com.br/callback'
picpay.return_url = 'http://www.sualoja.com.br/cliente/pedido/102030'
picpay.value = 45.55 # format decimal
picpay.expires_at = '11/11/2022' # optional

# Payment Request
payment_request = picpay.payments()
payment_request.status
# => 200
payment_request.headers
# => {"server"=>"app.picpay.com", "content-type"=>"application/json; charset=utf-8"...
payment_request.body
# => "{referenceId: "102030"...

reference_id = '102030'
authorization_id = '555008cef7f321d00ef236333'

#Payment Cancellation 
payment_cancellation = picpay.payments_cancellations(reference_id, authorization_id)
payment_cancellation.status
# => 200
payment_cancellation.headers
# => {"server"=>"app.picpay.com", "content-type"=>"application/json; charset=utf-8"...
payment_cancellation.body
# => "{referenceId: "102030"...

# Payment Status
payment_status = picpay.payments_status(reference_id)
payment_status.status
# => 200
payment_status.headers
# => {"server"=>"app.picpay.com", "content-type"=>"application/json; charset=utf-8"...
payment_status.body
# => "{referenceId: "102030"...
```

## Example of Payment Request (JSON)

```json
{

    "referenceId": "102030",
    "callbackUrl": "http://www.sualoja.com.br/callback",
    "returnUrl": "http://www.sualoja.com.br/cliente/pedido/102030",
    "value": 20.51,
    "expiresAt": "2022-05-01T16:00:00-03:00",
    "buyer": 

    {
        "firstName": "Fulano",
        "lastName": "Da Silva Sousa",
        "document": "123.456.789-10",
        "email": "teste@gilcierweb.com.br",
        "phone": "+55 27 12345-6789"
    }

}
```

## Example of Payment Response (JSON)

```json
{

    "referenceId": "102030",
    "paymentUrl": "https://app.picpay.com/checkout/NWFmMGRjNmViZDc0Y2EwMDMwNzZlYzEw",
    "expiresAt": "2022-05-01T16:00:00-03:00",
    "qrcode": 

    {
        "content": "https://app.picpay.com/checkout/NWNlYzMxOTM1MDg1NGEwMDIwMzUxODcy",
        "base64": "data:image/png;base64,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"
    }

}
```

## Example of Payment Cancellation Request (JSON)

```json
{

    "authorizationId": "555008cef7f321d00ef236333"

}
```

## Example of Payment Cancellation Response (JSON)

```json
{

    "referenceId": "102030",
    "cancellationId": "5b008cef7f321d00ef236444"

}
```

## Example of Payment Status Request (JSON)


```shell
get https://appws.picpay.com/ecommerce/public/payments/{referenceId}/status
```

## Example of Payment Status Response (JSON)

```json
{

    "authorizationId": "555008cef7f321d00ef236333",
    "referenceId": "102030",
    "status": "paid"

}
```
## Example of Payment Notification Request (JSON)

```shell
post http://www.sualoja.com.br/callback
```
## Example of Payment Notification Response (JSON)

```json
{

    "referenceId": "102030",
    "authorizationId": "5b01780ba8914c001a007673"

}
```
return status 200 in your api callback

## Doação / Donate
Doar com PagSeguro 5,00, 10,00, 15,00, 20,00, 30,00, 40,00 ou outro valor

https://pag.ae/bmgSGGm

[![](https://raw.github.com/gilcierweb/shopfacil/master/examples/image/clique-para-doar-qualquer-quantia.jpg)](https://pag.ae/bmgSGGm)

## Consultoria / Consulting

http://gilcierweb.com.br

## Site

http://gilcierweb.com.br

## PicPay Site
https://www.picpay.com/site

## PicPay Documentation API
https://ecommerce.picpay.com/doc/


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/picpay. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Picpay project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/picpay/blob/master/CODE_OF_CONDUCT.md).
