module Api
  module V1
    class UserAfterSigninController < ::ApiController

      include ActionController::HttpAuthentication::Token::ControllerMethods

      before_action :authenticate_user, except: [:authenticate_user]

      def all_products
        products = Product.all

        products_and_reviews=Hash.new
        products.each do |p|
          product = p.product_and_reviews
          products_and_reviews[p.id] = product
        end

        response_data(products_and_reviews , "All products and reviews" ,200)
      end 

      def products_and_reviews
        products = current_user_api.products_reviewed
        products_and_reviews=Hash.new
        products.each do |p|
          product = p.product_and_reviews
          products_and_reviews[p.id] = product
        end

        response_data(products_and_reviews , "Products and Reviews" , 200)  

      end   
      
      def authenticate_user
        authenticate_with_http_token do |token, options|
          @current_user_api = User.find_by_access_token(token)
        end

        unless current_user_api
          return response_data({},"Not Authorised",401)
        end
      end

      def current_user_api
          @current_user_api
      end

    end
  end
end