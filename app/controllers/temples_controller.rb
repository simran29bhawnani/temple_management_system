class TemplesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_temple, only: [:show, :update, :destroy]

  def index
    @temples = Temple.all.map do |temple|
      temple_hash = temple.to_hash
      temple_hash
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

  private

    def find_temple
      @temple = Temple.find(params[:id])
    end

    def temple_params
      params.require(:temple).permit(:temple_name, :description, :temple_email, :phone_no, :temple_address, :city, :state, :country, :zipcode, :start_time, :end_time, :user_id, :temple_image)
    end
end
