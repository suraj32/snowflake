class UsersController < ApplicationController
  def new
    @user = User.find(request.headers[:HTTP_AUTHORIZATION])
  end
end
