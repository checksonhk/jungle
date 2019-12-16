class Session
  include ActiveModel::Validations
  attr_accessor :email, :password

  def initialize(email=nil, password=nil)
    @email = email
    @password = password
  end
  
  validates :email, presence: true
  validates :password, presence: true
end

class SessionsController < ApplicationController

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params[:email], session_params[:password])
    @session.valid?


    if user = User.authenticate_with_credentials(session_params[:email], session_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to :root
    else
    # If user's login doesn't work, send them back to the login form.
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private

  def session_params 
    params.require(:session).permit(
      :email, 
      :password
    )
  end  

end
