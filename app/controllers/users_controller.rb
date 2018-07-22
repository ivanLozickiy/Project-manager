class UsersController < ApplicationController
  def index
  	@users = User.all
  end
  def make_admin
  	user = User.find(params[:id])
  	user.admin = !user.admin
  	user.save
  end
end
