class PhotoVideoGalleriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @photo_video_gallerys = PhotoVideoGallery.all.map do |gallery|
      gallery_hash = gallery.to_hash
    end
    render json: {photo_video_gallerys: @photo_video_gallerys}, status: 200
  end

  def show
    @photo_video_gallery = PhotoVideoGallery.find(params[:id])
    temple_img = @photo_video_gallery&.temple_photo&.service_url if @photo_video_gallery&.temple_photo&.attached?
    render json: {photo_video_gallery: @photo_video_gallery, temple_image: temple_img}, status: 200
  end

  def create
    @photo_video_gallery = PhotoVideoGallery.new(photo_video_gallery_params)
    if  @photo_video_gallery.save
      render json: {message: 'Temple successfully created!', photo_video_gallery: @photo_video_gallery}, status: 200
    else
      render json: {message:  @photo_video_gallery.errors.full_messages}
    end
  end

  private

    def photo_video_gallery_params
      params.require(:gallery).permit(:temple_photo, :temple_photo, :temple_id)
    end
end
