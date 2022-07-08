class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[ show edit update destroy move ]
  before_action :authenticate_user!

  # GET /challenges or /challenges.json
  def index
    @title = "All challenges &mdash; Habitude".html_safe
    @challenges = Challenge.all
    @challenges = Challenge.where user_id: current_user.id
  end

  # GET /challenges/1 or /challenges/1.json
  def show
    if @challenge.user_id != current_user.id
      redirect_to challenge_url
      return
    end
    @title = "Challenge: " + @challenge.name + " \u{2014} Habitude"
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
    @challenge.user_id = current_user.id
  end

  # GET /challenges/1/edit
  def edit
    if @challenge.user_id != current_user.id
      redirect_to challenge_url
      return
    end
  end

  # POST /challenges or /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.user_id != current_user.id
      redirect_to challenge_url
      return
    end
    respond_to do |format|
      if @challenge.save
        format.html { redirect_to challenge_url(@challenge), notice: "Your challenge was successfully created." }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1 or /challenges/1.json
  def update
    if @challenge.user_id != current_user.id
      redirect_to challenge_url
      return
    end
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to challenge_url(@challenge), notice: "Your challenge was successfully updated." }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1 or /challenges/1.json
  def destroy
    if @challenge.user_id != current_user.id
      redirect_to challenge_url
      return
    end
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: "Your challenge was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def move
    @challenge.insert_at(params[:position].to_i)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def challenge_params
      params.require(:challenge).permit(:cdate, :name, :check, :position, :user_id)
    end
end