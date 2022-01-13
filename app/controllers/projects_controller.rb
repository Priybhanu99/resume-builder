class ProjectsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :update, :new_one]

    def new
        @project = project.new
    end

    def new_one
        experience = current_user.profile.experiences.find(params[:id])
        experience.projects.create
        flash[:success] = "New Project added."
        redirect_to edit_url
    end

    def create
        @project = project.new(project_params)
        if @project.save
            flash[:success] = "Project was successfully created."
        else
            flash[:danger] = "Project creation failed."
        end
        redirect_to edit_url
    end

    def update
      updated_project_params = update_array_attributes_in_params(project_params)
      @project = Project.find(params[:id])
      if @project.update(updated_project_params)
          flash[:success] = "Project was successfully updated."
          redirect_to edit_url
      else
          flash[:danger] = "Project update failed."
          redirect_to edit_url
      end
  end

    private
      def project_params
        params.require(:project).permit(:title, :description, :url, :tech_stack, :_destroy)
      end
  
  end
  