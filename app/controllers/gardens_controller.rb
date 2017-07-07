class GardensController < ApplicationController
  before_action { set_navbar("garden") }
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_garden, only: [:edit, :update, :destroy]

  def index
    if(params[:view_list])
      @gardens = Garden.ordered_with_reports_desc.all
      render("gardens/index_list")
    else
      @garden_reports = GardenReport.order(:created_at => :desc)
      render("gardens/index_photos")
    end
  end

  def show
    @garden = Garden.ordered_with_reports_desc.find(params[:id])
  end

  def new
    @garden = Garden.new
  end

  def edit
  end

  def create
    @garden = Garden.new(garden_params)

    respond_to do |format|
      if @garden.save
        format.html { redirect_to @garden, notice: 'Garden was successfully created.' }
        format.json { render :show, status: :created, location: @garden }
      else
        format.html { render :new }
        format.json { render json: @garden.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @garden.update(garden_params)
        format.html { redirect_to @garden, notice: 'Garden was successfully updated.' }
        format.json { render :show, status: :ok, location: @garden }
      else
        format.html { render :edit }
        format.json { render json: @garden.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @garden.destroy
    respond_to do |format|
      format.html { redirect_to gardens_url, notice: 'Garden was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :location, :description)
  end
end
