class PhotosController < ApplicationController

  def index

    @list_of_photos = Photo.all

    render({:template => "photo_templates/index.html.erb"})
  end


  def show
    the_id = params.fetch("photo_id")

    @the_photo = Photo.where({:id => the_id}).first

    render({:template => "photo_templates/show.html.erb"})
  end

  def delete

    the_id = params.fetch("photo_id")

    the_photo = Photo.where({:id => the_id}).first

    #the_photo.destroy
    
    #render({:template => "photo_templates/delete.html.erb"})

    redirect_to("/photos")

  end

  def create
    the_photo_image = params.fetch("query_image")
    the_photo_caption = params.fetch("query_caption")
    the_photo_owner = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = the_photo_image
    a_new_photo.caption = the_photo_caption
    a_new_photo.owner_id = the_photo_owner

    a_new_photo.save

    #render({:template => "photo_templates/create.html.erb"})
    redirect_to ("/photos/" + a_new_photo.id.to_s)

  end
end
