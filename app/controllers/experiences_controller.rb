class ExperiencesController < ApplicationController
  before_action :logged_in_user, only: [:new]
  
  # GET /experiences/new
  def new
    current_user.profile.experiences.create
    flash[:success] = "New Experience added"
    redirect_to edit_url
  end

  # def create
  #   @experience = Experience.new(experience_params)

  #   respond_to do |format|
  #     if @experience.save
  #       format.html { redirect_to experience_url(@experience), notice: "Experience was successfully created." }
  #       format.json { render :show, status: :created, location: @experience }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @experience.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /experiences/1 or /experiences/1.json
  # def update
  #   respond_to do |format|
  #     if @experience.update(experience_params)
  #       format.html { redirect_to experience_url(@experience), notice: "Experience was successfully updated." }
  #       format.json { render :show, status: :ok, location: @experience }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @experience.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /experiences/1 or /experiences/1.json
  # def destroy
  #   @experience.destroy

  #   respond_to do |format|
  #     format.html { redirect_to experiences_url, notice: "Experience was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_experience
  #     @experience = Experience.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def experience_params
  #     params.require(:experience).permit(:company, :position, :start_date, :end_date, :description)
  #   end
end
