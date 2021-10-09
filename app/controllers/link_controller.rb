class LinkController < ApplicationController

    def index
        @links = Link.all
    end 

    def new 
        @link = Link.new
        @tag = Tag.new
    end 
    
    def create
        @link = Link.new(link_params)
        @tag = Tag.new(tag_params)
        @link.save 
        @tag.save
        @link.tags << @tag
        redirect_to show_path
    end
    
    def show 
    end 

    def search 
       
    end

    def result
        @t = Tag.find_by_tag_name(result_param)
        @l = @t.links
    end 

 private 
    def link_params
        params.require(:link).permit(:url)
    end

    def tag_params
        params.require(:tag).permit(:tag_name)
    end

    def result_param
        params.require(:query)
    end
end