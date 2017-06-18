class GardenReportsController < ApplicationController
  before_action :set_garden_report, only: [:show, :edit, :update, :destroy]

  # GET /garden_reports
  # GET /garden_reports.json
  def index
    @garden_reports = GardenReport.all
  end

  # GET /garden_reports/1
  # GET /garden_reports/1.json
  def show
  end

  # GET /garden_reports/new
  def new
    @garden_report = GardenReport.new
  end

  # GET /garden_reports/1/edit
  def edit
  end

  # POST /garden_reports
  # POST /garden_reports.json
  def create
    @garden_report = GardenReport.new(garden_report_params)

    respond_to do |format|
      if @garden_report.save
        format.html { redirect_to @garden_report, notice: 'Garden report was successfully created.' }
        format.json { render :show, status: :created, location: @garden_report }
      else
        format.html { render :new }
        format.json { render json: @garden_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garden_reports/1
  # PATCH/PUT /garden_reports/1.json
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

  # DELETE /garden_reports/1
  # DELETE /garden_reports/1.json
  def destroy
    @garden_report.destroy
    respond_to do |format|
      format.html { redirect_to garden_reports_url, notice: 'Garden report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden_report
      @garden_report = GardenReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garden_report_params
      params.require(:garden_report).permit(:notes, :garden_id)
    end
end
