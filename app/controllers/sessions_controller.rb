class SessionsController < ApplicationController

def new
end

def create
 user = User.where(email: params[:email]).first

 if user && user.authenticate(params[:password])
   session[:user_id] = user.id
   redirect_to questions_path
 else
   flash[:errors] = "Invalid username or password"
   render :new
 end
end

def destroy
  if session[:user_id] != nil
    session[:user_id] = nil
    flash[:success] = "Signed out successfully"
    redirect_to questions_path
  else
    flash[:errors] = "You are not signed in anyway"
    redirect_to questions_path
  end
end

end
