class Api::V1::AuthController < ApplicationController
  def create
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      # issue user a token
      render json: user
    else
      render json: {error: 'You must be playing yoself ... '}, status: 401
    end
  end

  def show
    token = request.headers['token']
    decoded = JWT.decode(token, ENV['secret'], true, { algorithm: ENV['algo'] })
    user = User.find_by(username: decoded[0]['username'])

    if user
      render json: user
    else
      render json: {error: 'You must be playing yoself ... '}, status: 401
    end
  end

  def snake
    user = User.find_by(username: params[:username])
    if user
      render json: user
    else
      render json: {error: 'You must be playing yoself ... '}, status: 401
    end
  end

end
