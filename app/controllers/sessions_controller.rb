class SessionsController < ApplicationController

	def new

	end

  def create
    @user = User.authenticate(params[:session][:email], params[:session][:password])

    if @user.nil?
      flash.now[:error] = "Invalid email/password combination."
      render 'new'
    else
      session[:current_user_id] = @user.id
			
      if @user.admin?
        redirect_to users_path
      else
        if @user.user_type == "PRESENTER"
          redirect_to user_submissions_path(@user)
        end
        if @user.user_type == "ATTENDEE"
          redirect_to attendee_path
        end
        if @user.user_type == "VOLUNTEER"
          redirect_to volunteer_path
        end
      end
    end
  end

  def destroy
    session[:current_user_id] = nil
    reset_session
    redirect_to root_path
  end

end
