
before do
  @user = User.get(session[:user_id])
end

get "/" do
  "Hello, anonymous."
end

get "/protected", :auth => :user do
  "Hello, #{@user.name}."
end

post "/login" do
  session[:user_id] = User.authenticate(params).id
end

get "/logout" do
  session[:user_id] = nil
end




