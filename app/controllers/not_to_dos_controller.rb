class NotToDosController < ApplicationController
  before_action :set_not_to_do, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /not_to_dos or /not_to_dos.json
  def index
    @not_to_dos = NotToDo.all
    @not_to_dos = NotToDo.where user_id: current_user.id
  end

  # GET /not_to_dos/1 or /not_to_dos/1.json
  def show
    if @not_to_do.user_id != current_user.id
      redirect_to not_to_do_url
      return
    end
  end

  # GET /not_to_dos/new
  def new
    @not_to_do = NotToDo.new
    @not_to_do.user_id = current_user.id
  end

  # GET /not_to_dos/1/edit
  def edit
    if @not_to_do.user_id != current_user.id
      redirect_to not_to_do_url
      return
    end
  end

  # POST /not_to_dos or /not_to_dos.json
  def create
    @not_to_do = NotToDo.new(not_to_do_params)
    if @not_to_do.user_id != current_user.id
      redirect_to not_to_do_url
      return
    end
    respond_to do |format|
      if @not_to_do.save
        format.html { redirect_to not_to_do_url(@not_to_do), notice: "Your not-to-do was successfully created." }
        format.json { render :show, status: :created, location: @not_to_do }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @not_to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /not_to_dos/1 or /not_to_dos/1.json
  def update
    if @not_to_do.user_id != current_user.id
      redirect_to not_to_do_url
      return
    end
    respond_to do |format|
      if @not_to_do.update(not_to_do_params)
        format.html { redirect_to not_to_do_url(@not_to_do), notice: "Your not-to-do was successfully updated." }
        format.json { render :show, status: :ok, location: @not_to_do }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @not_to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /not_to_dos/1 or /not_to_dos/1.json
  def destroy
    if @not_to_do.user_id != current_user.id
      redirect_to not_to_do_url
      return
    end
    @not_to_do.destroy
    respond_to do |format|
      format.html { redirect_to not_to_dos_url, notice: "Your not-to-do was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_not_to_do
      @not_to_do = NotToDo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def not_to_do_params
      params.require(:not_to_do).permit(:listdate, :done, :name, :position, :priority, :user_id)
    end
end