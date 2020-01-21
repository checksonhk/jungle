# Jungle

Jungle is a mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
Jungle was built with users in mind from the main catalog to each products detail page.
Some special features of Jungle is its rating system, email confirmation capabilities, and authentication processes:
  1. The rating system built into Jungle adjusts to changes in ratings in real time and can be viewed on both the catalog page and each product detail page
  2. Jungle is set up with Action Mailer to send out simple email confirmations to users upon purchase
  3. While users do not need to be signed in to view the products catalog and respective detail pages, a user must sign in to submit a review or delete a review and admin users have an extra step of authentication to access the create product and create category pages

## Captures

!["Product Catalog: Logged-In User"](https://github.com/checksonhk/jungle/blob/master/img/demo-1.gif)
!["Product Catelog Continued: Multiple Badges"](https://github.com/checksonhk/jungle/blob/master/img/demo-2.gif)


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
