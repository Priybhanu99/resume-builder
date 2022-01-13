class ExperiencesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update]
  
  # GET /experiences/new
  def new
    current_user.profile.experiences.create
    flash[:success] = "New Experience added"
    redirect_to edit_url
  end

  def create
    @experience = Experience.new(experience_params)

    respond_to do |format|
      if @experience.save
        flash[:success] = "Experience was successfully created."
      else
        flash[:danger] = "Experience creation failed."
      end
    end
  end

  # # PATCH/PUT /experiences/1 or /experiences/1.json
  def update
    
    updated_experience_params = update_array_attributes_in_params(experience_params)
    @experience = Experience.find(params[:id])
    @project = Project.update(experience_params.require(:projects_attributes))
    if @experience.update(updated_experience_params)
      flash[:success] = "Experience was successfully updated."
      redirect_to edit_url
    else
      flash[:danger] = "Experience update failed."
      redirect_to edit_url
    end

  end

  # # DELETE /experiences/1 or /experiences/1.json
  # def destroy
  #   @experience.destroy

  #   respond_to do |format|
  #     format.html { redirect_to experiences_url, notice: "Experience was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

    #   # Use callbacks to share common setup or constraints between actions.
  #   def set_experience
  #     @experience = Experience.find(params[:id])
  #   end

    # Only allow a list of trusted parameters through.
  private
    def experience_params
      params.require(:experience).permit(:company, :position, :start_date, :end_date, :description,
           :projects_attributes => [ :id, :title, :description, :url, :tech_stack, :_destroy]      
      )
    end
end
