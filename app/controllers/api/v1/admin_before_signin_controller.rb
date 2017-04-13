module Api
  module V1
    class AdminBeforeSigninController < ::ApiController

      def sign_in
        email = params["email"]
        password = params["password"]
        admin = Admin.find_by_email(email)
        if admin
          if admin.valid_password? password
            data = Hash.new
            data["access_token"] = admin.access_token
            return response_data(data, "Signed In", 200)

          else
            return response_data({}, "Password Invalid", 200)

          end

        else
          return response_data({}, "Admin doesn't exist", 200)
        end
      end

      def sign_up
        email = params["email"]
        password = params["password"]
        reconfirm_password=params["reconfirm_password"]
        admin = Admin.find_by_email(email)
       
        if admin
          return response_data({} , "Email already taken" , 200)
        else
          if password==reconfirm_password
            return response_data({} , "Admin successfully created" , 200)
          else
            return response_data({} , "password and confirmation password not matching" , 200)
          end
        end

      end

    end
  end
end
