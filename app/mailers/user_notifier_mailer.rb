class UserNotifierMailer < ApplicationMailer
    default :from => 'any_from_address@example.com'
  
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_confirmation_order(user)
      @user = user
      mail( :to => @user.email,
      :subject => 'Thanks for signing up for our amazing app' )
    end
  
    private
    
    def user_params
      params.require(:user).permit(:email)
    end
  end