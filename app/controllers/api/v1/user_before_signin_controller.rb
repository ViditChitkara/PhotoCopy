module Api
  module V1
    class UserBeforeSigninController < ::ApiController

      def sign_in
        email = params["email"]
        password = params["password"]
        user = User.find_by_email(email)
        if user
          if user.valid_password? password
            data = Hash.new
            data["access_token"] = user.access_token
            return response_data(data, "Signed In", 200)

          else
            return response_data({}, "Password Invalid", 200)

          end

        else
          return response_data({}, "User doesn't exist", 200)
        end
      end

      def sign_up
        email = params["email"]
        password = params["password"]
        reconfirm_password=params["reconfirm_password"]
        user = User.find_by_email(email)
       
        if user
          return response_data({} , "Email already taken" , 200)
        else
          if password==reconfirm_password
            user = User.create(:email => email , :password => password , :password_confirmation => reconfirm_password)
            user.save
            return response_data({} , "user successfully created" , 200)
          else
            return response_data({} , "password and confirmation password not matching" , 200)
          end
        end

      end


    end
  end
end
