class TopicsController < ApplicationController
  def index
    @topics = current_user.topics
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
  end

  def edit
  end

  def destroy
    topic = Topic.find(params[:id])
    title = topic.title

    if topic.destroy
      flash[:notice] = "\"#{title}\" has been deleted."
      redirect_to topics_path
    else
      flash[:error] = "Something went wrong; the topic was not deleted. Please try again."
      redirect_to topics_path
    end
  end
end
