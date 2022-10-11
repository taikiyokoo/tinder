class ReactionsController < ApplicationController
   
  def create

    @user=User.find(params[:user_id])
    reaction = Reaction.find_or_initialize_by(to_user_id: params[:user_id], from_user_id: current_user.id)
    reaction.update_attributes(
      status: params[:reaction]
    )
    if params[:content]=="nil"
      redirect_to user_path(@user)
    else
      head :no_content
    end
  end

  def destroy
    @reaction=Reaction.find(params[:id])
    @user_id=@reaction.to_user_id
    @user=User.find(@user_id)
    @reaction.destroy
    redirect_to user_path(@user)
  end
end
