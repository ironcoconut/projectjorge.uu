class ParentsResourcesController < ApplicationController
  before_action { set_navbar("parents_resource") }
  before_action :set_parents_resource, only: [:show, :edit, :update, :destroy]
  before_action :categories, :age_range

  def index
    @parents_resources = ParentsResource.all
  end

  def show
  end

  def new
    @parents_resource = ParentsResource.new
  end

  def edit
  end

  def create
    @parents_resource = ParentsResource.new(parents_resource_params)

    respond_to do |format|
      if @parents_resource.save
        format.html { redirect_to @parents_resource, notice: 'Parents resource was successfully created.' }
        format.json { render :show, status: :created, location: @parents_resource }
      else
        format.html { render :new }
        format.json { render json: @parents_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @parents_resource.update(parents_resource_params)
        format.html { redirect_to @parents_resource, notice: 'Parents resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @parents_resource }
      else
        format.html { render :edit }
        format.json { render json: @parents_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_parents_resource
      @parents_resource = ParentsResource.find(params[:id])
    end

    def parents_resource_params
      min, max = params[:parents_resource][:age_range].split(',').map(&:to_i)
      age_min = age_range[min]
      age_max = age_range[max]
      params.require(:parents_resource).permit(:title, :link, :notes, :category, :price).merge({age_min: age_min, age_max: age_max})
    end

    def categories
      @categories ||= %w(Books Classes Website Video Services Other)
    end

    def age_range
      @age_range ||= ['Pre-Pregnancy', '1st Trimester', '2nd Trimester', '3rd Trimester', 'Birth', '1st Week', '1 Month', '3 Months', '6 Months', '9 Months', '1 Year', 'Toddler', 'Child', 'Preteen', 'Teen']
    end
end
