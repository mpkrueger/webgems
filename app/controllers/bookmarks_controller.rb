class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @bookmark = Bookmark.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.topic_id = @topic.id

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to @topic
    else
      flash[:error] = "There was a problem; please try again."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    authorize @bookmark

    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "Uh oh, you update was not saved; please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])

    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Your bookmark was deleted."
      redirect_to @topic
    else
      flash[:error] = "Something went wrong."
      render @topic
    end

  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
