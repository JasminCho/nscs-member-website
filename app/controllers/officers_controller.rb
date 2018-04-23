class OfficersController < ApplicationController
    
    before_action :admin_user?, only: [:new, :edit, :create, :update, :destroy]
    
    def index
        @officers = Officer.all
    end
    
    def new
        @officers = Officer.new
    end

    def create
        @officers = Officer.new(officers_params)
        if @officers.save
            flash[:success] = "Officer added!"
            redirect_to officers_path
        else
            render 'new'
        end
    end
    
    def edit
        @officers = Officer.find(params[:id])
    end
    
    def update
        @officers = Officer.find(params[:id])
        if @officers.update_attributes(officers_params)
          flash[:success] = "Officer updated"
          redirect_to(officers_path)
        else 
            flash[:success] = "Failed to updated"
            render 'edit'
        end
    end
    
    def destroy
        Officer.find(params[:id]).destroy
        flash[:success] = "Officer deleted"
        redirect_to officers_path
    end
    
    private
    
    def officers_params
        params.require(:officer).permit(:email, :position, :name, :major, :year, :image)
    end
end
