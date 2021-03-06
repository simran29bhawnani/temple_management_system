class TemplesController < ApplicationController
  skip_before_action :verify_authenticity_token
  # include UploadImage
  before_action :find_temple, only: [:show, :update, :destroy]

  def index
    @temples = Temple.all.map do |temple|
      temple_hash = temple.to_hash
    end
    render json: {temples: @temples}, status: 200
  end

  def show
    temple_img = @temple&.temple_image&.service_url if @temple&.temple_image&.attached?
    render json: {temple: @temple, temple_image: temple_img}, status: 200
  end
  
  def new
    @temple = Temple.new
  end

  def create
    @temple = Temple.new(temple_params)
    # temple_image = UploadImage.upload_image_to_s3(params[:temple][:temple_image]) if params[:temple][:temple_image].present?
    @temple.temple_image_url = temple_image&.public_url if temple_image&.public_url.present?
    if @temple.save
      render json: {message: 'Temple successfully created!',temple: @temple}, status: 200
    else
      render json: {message: @temple.errors.full_messages}
    end
  end

  # def edit
  #   @temple = Temple.find(params[:id])
  # end

  def update
    if @temple.update(temple_params)
      render json: {message: 'Update successfully'}, status: 200
    else
      render json: {message: @temple.errors.full_messages}
    end
  end

  def destroy
    if @temple.destroy
      render json: {message: 'Temple successfully destroyed!'}, status: 200
    else
      render json: {message: @temple.errors.full_messages}
    end
  end

  def single_temple_detail
    temple_details = Temple.find_by(temple_name: params[:temple_name])
    if temple_details.present?
      temple_image = url_for(temple_details.temple_image) if temple_details.temple_image.attached?
      # temple_image = temple_details.temple_image_url if temple_details.temple_image.attached?
      render json: {details: temple_details, image_url: temple_image}, status: 200
    else
      render json: {message: 'Not found!'}
    end
  end

  private
    
    def find_temple
      @temple = Temple.find(params[:id])
    end

    def temple_params
      params.require(:temple).permit(:temple_name, :description, :temple_email, :phone_no, :temple_address, :city, :state, :country, :zipcode, :start_time, :end_time, :user_id, :temple_image)
    end
end
