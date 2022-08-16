class LinkController < ApplicationController
    before_action :authenticate_user!, only: %i[ new show search ]

    def index
        @links = Link.all
    end 

    def new 
        @link = Link.new
    end 
    
    def create
        @link = Link.new(link_params.merge(user_id: current_user.id))
        @link.save
        redirect_to show_path
    end
    
    def show 
    end 

    def search 
        @tag = ActsAsTaggableOn::Tag.all
        @tags = @tag.collect(&:name)
        
    end

    def result
        tag = []
        tag = result_param.split(',')
        @l = current_user.links.tagged_with(tag,  :any => true)
        tag.each { |x|
            @l = @l.tagged_with(x, :any => true)
        }
    end 

 private 
    def link_params
        params.require(:link).permit(:url,:tag_list)
    end

    def result_param
        params.require(:query)
    end
end
