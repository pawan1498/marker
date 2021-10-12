class LinkController < ApplicationController

    def index
        @links = Link.all
    end 

    def new 
        @link = Link.new
    end 
    
    def create
        p "-------------------------------------------------"
        @link = Link.new(link_params)
        @link.save
        redirect_to show_path
    end
    
    def show 
    end 

    def search 
    end

    def result
        @l = Link.tagged_with(result_param, :any => true)
    end 

 private 
    def link_params
        params.require(:link).permit(:url,:tag_list)
    end

    def result_param
        params.require(:query)
    end
end
