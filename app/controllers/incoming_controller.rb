class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    @user = User.find(params[:sender])
    @topic = Topic.find(params[:subject])
    @url = params["body-plain"]

    if user.nil?
      @user = User.new(email: params[:sender], password: 'password')
      @user.skip_confirmation!
      @user.save!
    end

    if topic.nil?
      @topic = Topic.create(title: params[:subject], user_id: @user.id)
    end

    bookmark = Bookmark.new(url: @url, topic_id: @topic.id)

    bookmark.save!


    head 200
  end
end