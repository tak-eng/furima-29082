class UsersController < ApplicationController
  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to controller: :items, action: :index
    else
      render action: :edit
  end
end
