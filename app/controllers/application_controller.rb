class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # @user = User.find params[:id]

  def self.search(v)
    search.index([/\s/]) ? search.split(" ") : search
    where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR address ILIKE ?", "%#{v}%", "%#{v}%", "%#{v}%", "%#{v}%")
  end

  def user_signed_in?
    session[:user_id].present?
  end

  helper_method :user_signed_in?
  #adding a helper_method call as in above, allows the view files (all of them in this case) to have access to this method.

  # def current_user
    #technique below is called memoization which fetched the user in this case the first time you call the method, and every subsequent time, it uses the one stored in the '@current_user' variable.

    # @current_user ||= User.find session[:user_id]
  # end
  # helper_method :current_user

  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end

end
