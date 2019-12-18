# Jungle

A mini e-commerce application built with Rails 4.2. Grant inherited the project from lighthouse labs and implemented many new features and fixed several bugs in the application. The project also had RSPEC and CapyBara tests implemented by Grant. Project required a solid understanding of Ruby on Rails, Heroku and git branching. Checkout the link at the top of the repo to test out the app on Heroku.

## Photos

### App Landing Page
![App Landing Page](https://github.com/granttaylor448/jungle-rails/blob/feature/order-receipt/app/photos/App_landing_page.png?raw=true)

### Stripe Enabled Checkout
![Stripe Enabled Checkout](https://github.com/granttaylor448/jungle-rails/blob/feature/order-receipt/app/photos/Stripe_enabled_checkout.png?raw=true)

### Sold Out badge on sold out products
![Sold Out badge on sold out products](https://github.com/granttaylor448/jungle-rails/blob/feature/order-receipt/app/photos/Sold_out_badged.png?raw=true)

### Register Page
![Register Page](https://github.com/granttaylor448/jungle-rails/blob/feature/order-receipt/app/photos/products_organized_by_category.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* CapyBara
* Poltergeist
* Database Cleaner
* Rails bcrypt
* Puma
* RSPEC

