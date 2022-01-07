class TempleHistoryDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_temple_history_detail, only: [:show, :update, :destroy]

  def index
    @temple_history_details = TempleHistoryDetail.all
    render json: {temple_history_detail: @temple_history_detail}
  end

  def show
    render json: {temple_history_detail: @temple_history_detail}, status: 200
  end

  def new
    @temple_history_detail = TempleHistoryDetail.new
  end

  def create
    @temple_history_detail = TempleHistoryDetail.new(temple_history_details_params)
    if @temple_history_detail.save
      render json: {message: 'Temple history successfully created!',temple_history_detail: @temple_history_detail}, status: 200
    else
      render json: {message: @temple_history_detail.errors.full_messages}
    end
  end

  def update
    @temple_history_detail = TempleHistoryDetail.find(params[:id])
    if @temple_history_detail.update(temple_history_details_params)
      render json: {message: 'Update successfully', temple_history_detail: @temple_history_detail}, status: 200
    else
      render json: {message: @temple_history_detail.errors.full_messages}
    end
  end

  def destroy
    if @temple_history_detail.destroy
      render json: {message: 'Temple history successfully destroyed!'}, status: 200
    else
      render json: {message: @temple_history_detail.errors.full_messages}
    end
  end

  private

    def find_temple_history_detail
      @temple_history_detail = TempleHistoryDetail.find(params[:id])
    end

    def temple_history_details_params
      params.require(:temple_history_detail).permit(:temple_history, :temple_structure, :inside_temple_theertham, :outside_temple_theertham, :temple_id, :temple_history_images, :temple_structure_images, :inside_temple_theertham_images, :outside_temple_theertham_images)
    end
end
