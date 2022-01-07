class OfflineCityCentresController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_offline_city_centre, only: [:show, :update, :destroy]
  
  def show
    render json: {offline_city_centre: @offline_city_centre}, status: 200
  end

  def new
    @offline_city_centre = OfflineCityCentre.new
  end

  def create
    @offline_city_centre = OfflineCityCentre.new(offline_city_centres_params)
    if @offline_city_centre.save
      render json: {message: 'Offline city centre successfully created!',offline_city_centre: @offline_city_centre}, status: 200
    else
      render json: {message: @offline_city_centre.errors.full_messages}
    end
  end

  def update
    if @offline_city_centre.update(offline_city_centres_params)
      render json: {message: 'Update successfully', offline_city_centre: @offline_city_centre}, status: 200
    else
      render json: {message: @offline_city_centre.errors.full_messages}
    end
  end

  def destroy
    if @offline_city_centre.destroy
      render json: {message: 'Offline city centre successfully destroyed!'}, status: 200
    else
      render json: {message: @offline_city_centre.errors.full_messages}
    end
  end

  private

    def find_offline_city_centre
      @offline_city_centre = OfflineCityCentre.find(params[:id])
    end

    def offline_city_centres_params
      params.require(:offline_city_centre).permit(:address, :city, :state, :pincode, :mail_id, :phone_no, :temple_id)
    end
end
