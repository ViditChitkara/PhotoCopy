module Api
  module V1
    class AdminAfterSigninController < ::ApiController

      include ActionController::HttpAuthentication::Token::ControllerMethods

      before_action :authenticate_admin, except: [:authenticate_admin]

      def all_users
        all_users = User.all
        response_data(all_users , "All users" , 200)
      end  

      def admin_products
        products = current_admin_api.all_products
        response_data(products , "Products of This Admin" , 200)
      end    
      
      def products_and_reviews
        products = current_admin_api.all_products
        products_and_reviews=Hash.new
        products.each do |p|
          product = p.product_and_reviews
          products_and_reviews[p.id] = product
        end

        response_data(products_and_reviews , "Products and Reviews" , 200)  

      end

      def authenticate_admin 
        authenticate_with_http_token do |token, options|
          @current_admin_api = Admin.find_by_access_token(token)
        end

        unless current_admin_api
          return response_data({},"Not Authorised",401)
        end
      end

      def current_admin_api
          @current_admin_api
      end

    end
  end
end