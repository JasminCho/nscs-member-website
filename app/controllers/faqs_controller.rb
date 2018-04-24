class FaqsController < ApplicationController
    
    before_action :admin_user?, only: [:edit, :update, :delete, :new]
    
    def index
        @faqs = Faq.all
    end
    
    def new
        @faqs = Faq.new
    end
    
    def create
        @faqs = Faq.new(faqs_params)
        if @faqs.save
            redirect_to(faqs_path)
        else
            render 'new'
        end
    end
    
    def edit
        @faqs = Faq.find(params[:id])
    end
    
    def update
         @faqs = Faq.find(params[:id])
        if @faqs.update_attributes(faqs_params)
          flash[:success] = "FAQ updated"
          redirect_to(faqs_path)
        else
          render 'edit'
        end
    end
    
    def destroy
        Faq.find(params[:id]).destroy
        flash[:success] = "FAQ deleted"
        redirect_to faqs_path
    end
    
    private
    
    def faqs_params 
        params.require(:faq).permit(:question, :answer)
    end
end
