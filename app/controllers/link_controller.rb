class LinkController < ApplicationController
	before_action :authenticate_user!, only: %i[ new show search ]

  def index
    @links = Link.all
  end

	def new
		@link = Link.new
	end
	
	def create
		@link = Link.new(url: link_params[:url], user_id: current_user.id)
		owned_tag_list = link_params[:tag_list]
		current_user.tag(@link, :with =>(owned_tag_list), :on => :tags, :skip_save => true)
		@link.save
		redirect_to show_path
	end
	
	def show
	end

  def search
  end

  def result
    tag = []
    tag = result_param.split(',')
    @l = Link.tagged_with(tag,  :any => true)
    tag.each { |x|
        @l = @l.tagged_with(x, :any => true)
    }
  end

  private

  def result_param
    params.require(:query)
  end
end
