class GardenReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_garden_report, only: [:show, :edit, :update, :destroy]

  def index
    @garden_reports = GardenReport.all
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
        format.html { redirect_to garden_report_path(id: @garden_report.id, garden_id: @garden_report.garden_id), notice: 'Garden report was successfully created.' }
        format.json { render :show, status: :created, location: @garden_report }
      else
        format.html { render :new }
        format.json { render json: @garden_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @garden_report.update(garden_report_params)
        format.html { redirect_to @garden_report, notice: 'Garden report was successfully updated.' }
        format.json { render :show, status: :ok, location: @garden_report }
      else
        format.html { render :edit }
        format.json { render json: @garden_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @garden_report.destroy
    respond_to do |format|
      format.html { redirect_to garden_reports_url, notice: 'Garden report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_garden_report
      @garden_report = GardenReport.find(params[:id])
    end

    def garden_report_params
      params.require(:garden_report).permit(:notes, :photo).merge(params.permit(:garden_id))
    end
end
