module ApplicationHelper

	def user_logged
		if(session == nil || session[:current_user_id] == nil)
			redirect_to(root_path)
		end
  end

	def admin_user
		if session[:current_user_id].nil? || !User.find(session[:current_user_id]).admin?
			redirect_to(root_path)
		end
  end

	def current_page
		params[:controller] + "-" + params[:action]
	end

	def get_user_name(id)
		user = User.find(id)
		user.name
	end

end
