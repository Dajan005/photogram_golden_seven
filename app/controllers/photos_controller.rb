class PhotosController < ApplicationController
  def index
# params = {"the_source" => 4, "the_caption" => 5
    @list_of_photos = Photo.all
  end

  def show
      @photo = Photo.find_by({ :id => params[:id] })
      @photo_source = @photo.source
      @photo_caption = @photo.caption
      @photo_id = @photo.id
  end

  def new_form
      render  ("/photos/new_form.html.erb")
  end

  def create_row
    p=Photo.new
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save

  redirect_to("http://localhost:3000/photos")
end

def destroy
  i = Photo.find_by({ :id => params[:id] })
  i.destroy

  redirect_to("http://localhost:3000/photos")

end

def edit_form
  @photo = Photo.find_by({ :id => params[:id] })

  render  ("/photos/edit_form.html.erb")

end

def update_row
  p=Photo.find_by({ :id=>params[:id]})
  p.caption = params[:the_caption]
  p.source  = params[:the_source]
  p.save

  @photo = Photo.find_by({ :id=>params[:id]})

  redirect_to("/photos/:id")
end

end
