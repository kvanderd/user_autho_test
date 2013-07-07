get '/' do

 # render home page
 #TODO: Show all users if user is signed in
 @user = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end


post '/sessions' do
	puts params
  user = User.authenticate(params[:email], params[:password])
    if user
      session[:user] = user
      redirect "/"
    else # login incorrect
      @error = "login failed please check email/password"
      erb :sign_in
    end
end

delete '/sessions/:id' do
	session.clear
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  @user = User.create(params[:user])
	if @user.save
      session[:user] = @user.id
    redirect "/"
  else
    erb :sign_up
  # sign-up a new user
  redirect "/"
  end
end
