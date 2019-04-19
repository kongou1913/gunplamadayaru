class TopicsController < ApplicationController
  def new
    if !logged_in?
      redirect_to login_path
    end
    @topic = Topic.new
  end

  def index
    @topics = Topic.all.includes(:favorite_users)
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :image1, :image2, :image3, :description)
  end
end
