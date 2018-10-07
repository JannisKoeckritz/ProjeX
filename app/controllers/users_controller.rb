class UsersController < ApplicationController
	def show
		@user = User.find(current_user.id)
	end

	# def search
	# 	if params[:search_param].blank?
	# 		flash.now[:danger] = "You have entered an empty search string"
	# 		binding.pry
	# 	else
	# 		@users = User.search(params[:search_param])
	# 		@users = current_user.except_current_user(@users)
	# 		flash.now[:danger] = "No users match this search criteria" if @users.blank?
	# 		binding.pry
	# 	end
	# 	respond_to do |format|
	# 		if !@users.blank?
	# 			format.js { render partial: 'members/result' }
	# 		else
	# 			format.html { root_path }
	# 		end
	# 	end
	# end

	def destroy
		@user = User.find(params[:id])
		binding.pry
		@user.destroy
		flash[:success] = "Dein Account wurde erfolgreich gelöscht."
		redirect_to root_path
	end
end