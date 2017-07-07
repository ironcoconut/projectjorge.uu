class GardenReportsController < ApplicationController
  before_action { set_navbar("garden") }
  before_action :authenticate_user!, except: [:show]

  def show
    @report = GardenReport.includes(:garden).find(params[:id])
  end

  def new
    @report = GardenReport.new
    @gardens = Garden.all
  end

  def edit
    @report = GardenReport.includes(:garden).find(params[:id])
    @gardens = Garden.all
  end

  def create
    @report = GardenReport.new(garden_report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to [@report.garden, @report], notice: 'Garden report was successfully created.' }
      else
        @gardens = Garden.all
        format.html { render :new }
      end
    end
  end

  def update
    @report = GardenReport.includes(:garden).find(params[:id])

    respond_to do |format|
      if @report.update(garden_report_params)
        format.html { redirect_to garden_garden_report_path([@report.garden, @report]), notice: 'Garden report was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @report = GardenReport.find(params[:id])
    @report.destroy
    respond_to do |format|
      format.html { redirect_to @report.garden, notice: 'Garden report was successfully destroyed.' }
    end
  end

  private

  def garden_report_params
    params.require(:garden_report).permit(:notes, :photo, :remove_photo, :garden_id, :photo_cache).merge(params.permit(:garden_id))
  end
end
