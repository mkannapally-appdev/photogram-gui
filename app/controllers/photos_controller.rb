class PhotosController < ApplicationController

  def index

    @list_of_photos = Photo.all

    render({:template => "photo_templates/index.html.erb"})
  end


  def show
    render({:template => "photo_templates/show.html.erb"})
  end

end
