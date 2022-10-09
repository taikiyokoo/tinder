class MatchingController < ApplicationController

    before_action :authenticate_user!

    def index
        @user=User.find(current_user.id)
        @matching_user=[]
        @users=User.all
        @users.each do |user|
            if Reaction.find_by(to_user: current_user.id,from_user: user.id,status: 0)&&Reaction.find_by(to_user: user.id,from_user: current_user.id,status: 0)
                @matching_user<<user
            end
        end
    end
end
