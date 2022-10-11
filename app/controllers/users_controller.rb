class UsersController < ApplicationController
    before_action :authenticate_user!

def index
    @users=User.where.not(id:current_user.id)
    @user=User.find(current_user.id)
end

def show
    @user = User.find(params[:id])
    @reaction=Reaction.find_by(to_user:@user.id,from_user:current_user.id)
end
end
