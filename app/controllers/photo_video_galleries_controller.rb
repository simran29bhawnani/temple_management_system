class PhotoVideoGalleriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  include UploadImage

  def index
    @photo_video_gallerys = PhotoVideoGallery.all.map do |gallery|
      gallery_hash = gallery.to_hash
    end
    render json: {photo_video_gallerys: @photo_video_gallerys}, status: 200
  end

  def fetch_single_temple_images
    temple = Temple.find_by(temple_name: params[:temple_name])
    @photo_video_gallerys = PhotoVideoGallery.where(temple_id: temple.id).map do |photo|
      gallery_hash = photo.to_hash
    end
    #get s3 url code
    # arr = []
    # photos.each do |p|
    #   p.temple_photo.service_url if p.temple_photo.attached?
    #   arr <<  p.temple_photo.service_url if p.temple_photo.attached?
    # end
    render json: {photo_video_gallerys: @photo_video_gallerys}, status: 200
  end

  def show
    @photo_video_gallery = PhotoVideoGallery.find(params[:id])
    temple_img = url_for(@photo_video_gallery&.temple_photo) if @photo_video_gallery&.temple_photo&.attached?
    # temple_img = @photo_video_gallery&.temple_photo&.service_url if @photo_video_gallery&.temple_photo&.attached?
    # temple_video = @photo_video_gallery&.temple_video&.service_url if @photo_video_gallery&.temple_video&.attached?
    render json: {photo_video_gallery: @photo_video_gallery, temple_image: temple_img, temple_video: temple_video}, status: 200
  end

  def create
    photo_video_gallery = PhotoVideoGallery.new(photo_video_gallery_params)
    #s3 upload code
    # photo = UploadImage.upload_image_to_s3(params[:gallery][:temple_photo], photo_video_gallery) if params[:gallery][:temple_photo].present?
    # video = UploadImage.upload_image_to_s3(params[:gallery][:temple_video]) if params[:gallery][:temple_video].present?
    # photo_video_gallery.photo_url = photo.public_url if photo&.public_url.present?
    # photo_video_gallery.video_url = video.public_url if video&.public_url.present?
    if photo_video_gallery.save
      render json: {message: 'Image and video successfully uploaded!', photo_video_gallery: photo_video_gallery}, status: 200
    else
      render json: {message:  photo_video_gallery.errors.full_messages}
    end
  end

  private

    def photo_video_gallery_params
      params.require(:gallery).permit(:temple_photo, :temple_video, :temple_id)
    end
end
