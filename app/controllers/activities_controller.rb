class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @pagy, @activities = pagy(extract_activity, items: per_page)
  end

  def show; end

  def new
    @activity = Activity.new
  end

  def edit; end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html do
        redirect_to activities_url, notice: 'Activity was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_activity
    @activity = Activity.friendly.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(
      :title, :content, :category, :start_day, :end_day, :image
    )
  end

  def extract_activity
    if params[:search]
      Activity.search(params[:search])
    else
      Activity.all.order(id: :desc)
    end
  end
end
