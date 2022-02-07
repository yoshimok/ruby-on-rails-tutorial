require "json"

class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def hello
    render text: "hoge"
  end

  def create
    body = JSON.parse(request.body.read, {symbolize_names: true})
    user = User.create(body)
    render json: user

  end

  def show
    users = User.all
    render json: users
  end

  def show_by_id
    @user = david = User.find_by(id: params[:id])
    render json: @user
  end

  def update
    body = JSON.parse(request.body.read, {symbolize_names: true})

    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    render json: @user
  end

  def delete
    user = User.find_by(id: params[:id])
    if user.id ==  params[:id] then
      user.destroy
    end
    render json: user
  end

  private
    def user_params
      params.require(:user).permit(:name, :age)
    end
end
