module BookmarksHelper
  def embed_content(url)
    embedly_api = Embedly::API.new :key => '47d8d6fef8404c398b5a5dfa5d1fd8a8', :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

    obj = embedly_api.oembed(:url => url).first
    
    # json_obj = JSON.parse(obj)
    if obj.type == "link"
      if obj.thumbnail_url == nil
        raw "<img src='http://c2c.sulekhalive.com/lccommon/images/no-image.png' width='150' height='150'>"
      else
        raw "<img src='#{obj.thumbnail_url}' width='150' height='150'>"
      end
    elsif obj.type == "video"
      raw obj.first.html
    end
  end

end
