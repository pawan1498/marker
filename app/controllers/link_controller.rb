class LinkController < ApplicationController
	before_action :authenticate_user!, only: %i[ new show search index]
	before_action :redirect_admin 
	def index
		@links = current_user.links
		@tags=[]
		@links.each do |link|
			link.tags.each do |tag |
				@tags << tag
			end 
		end 
	end 

	def new
		@link = Link.new
	end
	
	def create
		@link = Link.new(url: link_params[:url], user_id: current_user.id)
		owned_tag_list = link_params[:tag_list]
		current_user.tag(@link, :with =>(owned_tag_list), :on => :tags, :skip_save => true)
		@link.save
		redirect_to root_path
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
		# tag.each { |x|
		# 		@l = @l.tagged_with(x, :any => true)
		# }
	end

	def autocomplete
		keyword = params[:text]
		@all_tags = current_user.owned_tags
		if keyword.present? 
			@all_tags = @all_tags.where("name LIKE ? OR name LIKE ?", "#{keyword}%", "% #{keyword}%")
		else
			@all_tags = nil
		end 
		render json: @all_tags.present? ? @all_tags.pluck(:name) : nil
	end

private

	def link_params
		params.require(:link).permit(:url,:tag_list)
	end

	def result_param
		params.require(:query)
	end

	def redirect_admin
		if current_user.admin
			redirect_to admin_dashboard_index_path
		end 
	end 
end
