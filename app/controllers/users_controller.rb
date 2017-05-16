class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	# this is dangerous, allows outsiders to easily modify params string and update variables maliciously
    #@user = User.new(params[:user])    # Not the final implementation!
    
    # and this is the safer and accepted way to do this
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private # only available internally to the users controller / not exposed to web

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

end
