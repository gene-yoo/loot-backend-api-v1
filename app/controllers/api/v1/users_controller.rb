class Api::V1::UsersController < ApplicationController
  def create
    user = User.new({username: user_params['username'], password: user_params['password'], password_confirmation: user_params['passwordConfirmation']})

    if user.valid?
      user.save
      token = JWT.encode({id: user.id}, ENV['secret'], ENV['algo'])
      render json: { token: token, id: user.id, username: user.username }
    else
      render json: { error: 'You might rethink yoself.', status: 422 }
    end
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :passwordConfirmation)
  end

end
