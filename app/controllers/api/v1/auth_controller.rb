class Api::V1::AuthController < ApplicationController
  def create
    user = User.find_by(username: auth_params[:username])

    if user && user.authenticate(auth_params[:password])
      token = JWT.encode({id: user.id}, ENV['secret'], ENV['algo'])
      render json: { token: token, id: user.id, username: user.username }
    else
      render json: {error: 'You must be playing yoself ... '}, status: 401
    end
  end

  def show
    token = request.headers['token']
    decoded = JWT.decode(token, ENV['secret'], true, { algorithm: ENV['algo'] })
    user = User.find_by(id: decoded[0]['id'])

    if user
      render json: { token: token, id: user.id, username: user.username }
    else
      render json: {error: 'You must be playing yoself ... '}, status: 401
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:username, :password)
  end

end
