class DevotersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_devoter, only: [:show, :update, :destroy]

  def index
  end

  def show
    render json: {devoter: @devoter}, status: 200
  end
  
  def new
    @devoter = Devoter.new
  end

  def create
    @devoter = Devoter.new(devoter_params)
    if @devoter.save
      render json: {message: 'Devoter successfully created!',Devoter: @devoter}, status: 200
    else
      render json: {message: @devoter.errors.full_messages}
    end
  end

  # def edit
  #   @devoter = Devoter.find(params[:id])
  # end

  def update
    if @devoter.update(devoter_params)
      render json: {message: 'Update successfully'}, status: 200
    else
      render json: {message: @worship.errors.full_messages}
    end
  end

  def destroy
    if @devoter.destroy
      render json: {message: 'Successfully destroyed!'}, status: 200
    else
      render json: {message: @devoter.errors.full_messages}
    end
  end

  private

    def find_devoter
      @devoter = Devoter.find(params[:id])
    end

    def devoter_params
      params.require(:devoter).permit(:first_name, :last_name, :address, :mail_id, :contact, :id_proof, :proof_id_number, :temple_id)
    end
end
