class UserController < ApplicationController

	def session_for_mobile
		email = params[:user_email]
		password = params[:user_password]
		user = User.find_by(email: email)
		respond_to do |format|
			if user.nil?
				return render json: { status: false, message: "Usuario o contraseña incorrectos" }
			end
			if user.valid_password?(password)
				return render json: { status: true, token: user.session_token }
			else
				return render json: { status: false, message: "Usuario o contraseña incorrectos" }
			end
		end
	end

end