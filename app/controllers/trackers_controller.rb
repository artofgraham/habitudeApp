class TrackersController < ApplicationController
  before_action :set_tracker, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /trackers or /trackers.json
  def index
    @title = "All habit trackers &mdash; Habitude".html_safe
    @trackers = Tracker.all
    @trackers = Tracker.where user_id: current_user.id
    @trackers = Tracker.order("habitdate DESC")
  end

  # GET /trackers/1 or /trackers/1.json
  def show
    if @tracker.user_id != current_user.id
      redirect_to tracker_url
      return
    end
    @title = "Habit tracker: " + @tracker.title + " \u{2014} Habitude"
    @silver_button =  "&#9898".html_safe
  end

  # GET /trackers/new
  def new
    @tracker = Tracker.new
    @tracker.user_id = current_user.id
  end

  # GET /trackers/1/edit
  def edit
    if @tracker.user_id != current_user.id
      redirect_to tracker_url
      return
    end
  end

  # POST /trackers or /trackers.json
  def create
    @tracker = Tracker.new(tracker_params)
    if @tracker.user_id != current_user.id
      redirect_to tracker_url
      return
    end
    respond_to do |format|
      if @tracker.save
        format.html { redirect_to tracker_url(@tracker), notice: "Your tracker was successfully created." }
        format.json { render :show, status: :created, location: @tracker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackers/1 or /trackers/1.json
  def update
    if @tracker.user_id != current_user.id
      redirect_to tracker_url
      return
    end
    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to tracker_url(@tracker), notice: "Your tracker was successfully updated." }
        format.json { render :show, status: :ok, location: @tracker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/1 or /trackers/1.json
  def destroy
    if @tracker.user_id != current_user.id
      redirect_to tracker_url
      return
    end
    @tracker.destroy
    respond_to do |format|
      format.html { redirect_to trackers_url, notice: "Your tracker was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracker
      @tracker = Tracker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tracker_params
      params.require(:tracker).permit(:habitdate, :title, :score, :intention, :total, :user_id, :day1, :day2, :day3, :day4, :day5, :day6, :day7, :day8, :day9, :day10, :day11, :day12, :day13, :day14, :day15, :day16, :day17, :day18, :day19, :day20, :day21, :day22, :day23, :day24, :day25, :day26, :day27, :day28, :day29, :day30, :day31)
    end
end