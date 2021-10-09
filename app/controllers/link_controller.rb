class LinkController < ApplicationController

    def index
        @links = Link.all
    end 

    def new 
        @link = Link.new
        @tag = Tag.new
    end 
    
    def create
        p "--------------------------------------------------"
        @url = params.require(:url)
        @link = Link.new(url:@url)
        @link.save

        for a in 1..3
         b = "tag"+a.to_s
         @tag_params = params.require(b)
         @tag = Tag.new(tag_name:@tag_params)
         @tag.save
         @link.tags << @tag
        end
        
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
        params.require(:tag).permit(:tag_name )
    end

    def result_param
        params.require(:query)
    end
end