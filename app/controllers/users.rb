post '/user/login' do
  @user = User.find_by_username(params[:user][:username])
#  if @user.authenticate(params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect to('/user/home')
  else
    redirect to('/')
  end
end

get '/user/register' do
  erb :'user/register'
end

post '/user/register' do
  @current_user = User.new(
                            username: params[:user][:username],
                            email: params[:user][:email],
                            password: params[:user][:password],
                            password_confirmation: params[:user][:password_confirmation]
                          )
  @current_user.save
  if @current_user.errors.empty?
    session[:user_id] = @current_user.id
    redirect to('user/home')
  else
    @errors = @current_user.errors
    erb :'/user/register'
  end
end

get '/user/home' do
  @user = User.find(session[:user_id])
  erb :'user/home'
end
