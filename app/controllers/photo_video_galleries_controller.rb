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
    temple_video = @photo_video_gallery&.temple_video&.service_url if @photo_video_gallery&.temple_video&.attached?
    render json: {photo_video_gallery: @photo_video_gallery, temple_image: temple_img, temple_video: temple_video}, status: 200
  end

  def upload_photo
    @photo_video_gallery = PhotoVideoGallery.new(temple_photo: params[:temple_photo], temple_id: params[:temple_id])
    if  @photo_video_gallery.save
      render json: {message: 'Photo successfully uploaded!', photo_video_gallery: @photo_video_gallery}, status: 200
    else
      render json: {message:  @photo_video_gallery.errors.full_messages}
    end
  end

  def upload_video
    @photo_video_gallery = PhotoVideoGallery.new(temple_video: params[:temple_video], temple_id: params[:temple_id])
    if  @photo_video_gallery.save
      render json: {message: 'Video successfully uploaded!', photo_video_gallery: @photo_video_gallery}, status: 200
    else
      render json: {message:  @photo_video_gallery.errors.full_messages}
    end
  end
end
