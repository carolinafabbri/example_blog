class TaggingsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @tagging = Tagging.new(post: @post)
  end

  def create
    @tagging = Tagging.new(tagging_params)

    if @tagging.save
      redirect_to post_path(@tagging.post), notice: "#{@tagging.tag.name} tag added to post."
    else
      redirect_to post_path(@tagging.post), alert: 'Problem adding tag.'
    end
  end

  private

  def tagging_params
    params.require(:tagging).permit(:post_id, :tag_id)
  end
end
