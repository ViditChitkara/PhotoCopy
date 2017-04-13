module Api
  module V1
    class AdminAfterSigninController < ::ApiController

      include ActionController::HttpAuthentication::Token::ControllerMethods

      before_action :authenticate_admin, except: [:authenticate_admin]

      def all_users
        all_users = User.all
        response_data(all_users , "All users" , 200)
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