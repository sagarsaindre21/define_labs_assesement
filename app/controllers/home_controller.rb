#HomeController
class HomeController < ApplicationController
	def index
		if current_user.present?
		  redirect_to authors_path
		 else
		  redirect_to user_session_path
		end
	end
end