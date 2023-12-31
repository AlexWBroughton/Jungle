# Jungle

Welcome to Jungle, an e-commerce web app built with Ruby on Rails. This application allows users to browse and purchase products from various categories, as well as admin the ability to create sales for their products.

## Features

 * Browse products by category.
 * View product descriptions, prices, and availability.
 * Add products to your cart and proceed to the checkout page.
 * Apply admin discounts and view the final order total.
 * User authentication and account management.
 * Admin dashboard for managing products, categories, and sales.

## Installation

1. Clone the repository:
   $ git clone https://github.com/Fmoscovo/jungle.git
   $ cd jungle

2. install dependencies: $ bundle install

3. Create and seed the database: $ rails db:setup

4. Start the server: $ rails server

5. Access the application at localhost:3000

## Screenshots

![ScreenShot](https://github.com/AlexWBroughton/Jungle/blob/master/docs/Screen%20Shot%202023-08-30%20at%2012.47.00%20PM.png)
![ScreenShot](https://github.com/AlexWBroughton/Jungle/blob/master/docs/Screen%20Shot%202023-08-30%20at%2012.47.19%20PM.png)
![ScreenShot](https://github.com/AlexWBroughton/Jungle/blob/master/docs/Screen%20Shot%202023-08-30%20at%2012.48.01%20PM.png)

## Additional Setup

1. Run bundle install to install dependencies
2. Create config/database.yml by copying config/database.example.yml
3. Create config/secrets.yml by copying config/secrets.example.yml
4. Run bin/rails db:reset to create, load, and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run bin/rails s -b 0.0.0.0 to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
