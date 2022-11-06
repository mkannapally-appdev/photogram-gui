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

    the_photo.destroy
    
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

  def update
    the_update_caption = params.fetch("query_caption")

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({:id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.image = params.fetch("query_image")
    the_photo.caption = params.fetch("query_caption")

    the_photo.save

    redirect_to("/photos/" + the_id.to_s)

  end

  def add_comment
     
    photo_id = params.fetch("query_photo_id")
    user_id = params.fetch("query_user_id")
    new_user_comment = params.fetch("query_comment")
    
    new_comment = Comment.new
    new_comment.photo_id = photo_id
    new_comment.author_id = user_id
    new_comment.body = new_user_comment

    new_comment.save

    redirect_to("/photos/" + new_comment.photo_id.to_s)

  end
end
