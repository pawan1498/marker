class LinkController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @group = Group.new
    @str = @group.group_name()
  end

  def create
    group_name = params[:group_name]
    @group = Group.new(name: group_name)
    @group.save

    url = params[:url]
    tag = params[:tag_list]

    @link = Link.new(group_id: @group.id, url: url, tag_list: tag)

    if @link.save
      redirect_to show_path
    else
      @group.delete
      render :new
    end
  end

  def show
  end

  def search
  end

  def result
    tag = Array.new(10)
    tag = result_param.split(",")
    @l = Link.tagged_with(tag[0], :any => true)
    tag.each { |x|
      next if x == tag[0]
      @l = @l.tagged_with(x, :any => true)
    }
  end

  private

  def result_param
    params.require(:query)
  end
end
