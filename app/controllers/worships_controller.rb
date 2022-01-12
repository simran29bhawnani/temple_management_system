class WorshipsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_worship, only: [:show, :update, :destroy]

  def index
    @worships = Worship.all
    render json: {worships: @worships}
  end

  def show
    render json: {worship: @worship}, status: 200
  end

  def new
    @worship = Worship.new
  end

  def create
    @worship = Worship.new(worship_params)
    if @worship.save
      render json: {message: 'Successfully created!',worship: @worship}, status: 200
    else
      render json: {message: @worship.errors.full_messages}
    end
  end

  def update
    if @worship.update(worship_params)
      render json: {message: 'Update successfully', worship: @worship}, status: 200
    else
      render json: {message: @worship.errors.full_messages}
    end
  end

  def destroy
    if @worship.destroy
      render json: {message: 'Successfully destroyed!'}, status: 200
    else
      render json: {message: @worship.errors.full_messages}
    end
  end

  private

    def find_worship
      @worship = Worship.find(params[:id])
    end

    def worship_params
      params.require(:worship).permit(:name, :type_of_pooja, :pundit, :start_time, :end_time, :temple_id)
    end
end
