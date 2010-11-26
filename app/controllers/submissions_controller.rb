class SubmissionsController < ApplicationController

	include ApplicationHelper

	before_filter :user_logged, :only => [:new, :create, :show, :withdraw]
	before_filter :admin_user, :only => [:edit, :update]

	def index
		@submissions = User.find(session[:current_user_id]).submissions
	end

  def new
		@submission = Submission.new()
  end

	def create
		@submission = Submission.new(params[:submission])

		@submission.user_id = User.find(session[:current_user_id]).id

		if @submission.save
      flash[:success] = "Submission successful! We will contact you with more details."
      redirect_to user_submissions_path(@submission.user)
    else
      render 'new'
    end
	end

	def edit
		@user = User.find(params[:user_id])
    @submission = Submission.find(params[:id])
  end

  def update
		@submission = Submission.find(params[:id])

    if @submission.update_attributes(params[:submission])
      flash[:success] = "Submission updated."
      redirect_to users_path
    else
      render 'edit'
    end

  end

	def show
		@submission = Submission.find(params[:id])
	end

	def withdraw
		@submission = Submission.find(params[:id])
		if(@submission.user.id == session[:current_user_id])
			@submission.submission_status = "WITHDRAWN"
			if @submission.save
				flash[:success] = "Submission updated."
			else
				flash[:error] = "Submission could not be updated. Please try again later."
			end
		end
		redirect_to user_submissions_path(@submission.user)
	end

end
