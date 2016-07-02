# Override of Devise controller to customize the permited fields
class RegistrationsController < Devise::RegistrationsController

  def sign_up_params
   params.require(:user).permit(:email, :name, :password,
                                :password_confirmation, :current_password)
 end

 def account_update_params
   params.require(:user).permit(:email, :name, :password,
                                :password_confirmation, :current_password)
 end

end
