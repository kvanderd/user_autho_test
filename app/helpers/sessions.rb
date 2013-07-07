helpers do

  def current_user
  	if session[:user]
      @current_user ||= User.find(session[:user])
    end
    # TODO: return the current user if there is a user signed in.
  end

end
