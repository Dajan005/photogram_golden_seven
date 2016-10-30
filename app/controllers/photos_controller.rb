class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
      @photo = Photo.find_by({ :id => params[:id] })
      @photo_source = @photo.source
      @photo_caption = @photo.caption
      @photo_id = @photo.id
  end

  def new_form
      render  ("/photos/new.html.erb")
  end

  def create_row
    p=Photo.new
    p.source = params["the_source"]
    p.caption = params["the_caption"]
    p.save

  redirect_to("http://localhost:3000/photos")
end

def destroy
  @photo_delete = Photo.find_by({ :id => params[:id] })
  @delete = @photo_delete.destroy

  redirect_to("http://localhost:3000/photos")

end

def edit_form
  @photo_edit = Photo.find_by({ :id => params[:id] })
  @photo_edit_source = @photo_edit.source
  @photo_edit_caption = @photo_edit.caption
  @photo_edit_id = @photo_edit.id
  render  ("/photos/edit.html.erb")

end

def update_row

  # params = {:the_caption => "Lake Bondhus", :the_source" => "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/1280px-Lake_Bondhus_Norway_2862.jpg"}

  i = Photo.find_by({ :id=>params[:id] })
  i.caption = params[:updated_caption]
  i.source = params[:updated_source]
  i.save

  @photo = Photo.find_by({ :id => params[:id] })

  redirect_to("/photos/#{@photo.id}")
end

end
