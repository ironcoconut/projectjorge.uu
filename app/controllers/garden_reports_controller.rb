class GardenReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_garden
  before_action :set_garden_report, only: [:show, :edit, :update, :destroy]

  def index
    @garden_reports = GardenReport.includes(:garden).all
  end

  def show
  end

  def new
    @garden_report = GardenReport.new
  end

  def edit
  end

  def create
    @garden_report = GardenReport.new(garden_report_params)

    respond_to do |format|
      if @garden_report.save
        format.html { redirect_to [@garden, @garden_report], notice: 'Garden report was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @garden_report.update(garden_report_params)
        format.html { redirect_to garden_garden_report_path([@garden, @garden_report]), notice: 'Garden report was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @garden_report.destroy
    respond_to do |format|
      format.html { redirect_to garden_reports_url, notice: 'Garden report was successfully destroyed.' }
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def set_garden_report
    @garden_report = GardenReport.find(params[:id])
  end

  def garden_report_params
    params.require(:garden_report).permit(:notes, :photo, :remove_photo).merge(params.permit(:garden_id))
  end
end
