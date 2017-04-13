module Api
  module V1
    class UsersLoggedInController < ::ApiController

      include ActionController::HttpAuthentication::Token::ControllerMethods

      before_action :authenticate_user, except: [:authenticate_user]

      
      
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