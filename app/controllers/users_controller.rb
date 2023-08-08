class UsersController < ApplicationController

    def show
     @user = current_user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(first_name: params[:user][:first_name], last_name: params[:user][:last_name], description: params[:user][:description])
            puts @user.description
            flash[:notice] = "enregistrer"
            redirect_to user_path(@user.id)
            
        else 
          puts  @user.errors.full_messages
           render :new
        end
    end


    def edit 
        @user = current_user 
        
    end
    
end
