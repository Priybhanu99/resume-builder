class ProfilesController < ApplicationController
    include HomeHelper
    include ProfilesHelper

    before_action :logged_in_user, only: [:update]
    before_action :correct_user,   only: [:update]

    def new
        @profile = Profile.new
    end

    def create(user_id)
        @profile = Profile.new(user_id: user_id)
        @profile.image.attach(io: File.open('app/assets/images/download.png'), filename: 'download.png')
        flash[:success] = "Image attached successfully."
        if @profile.save
            flash[:success] = "Profile created successfully."            
        else
            flash[:danger] = "Profile creation failed."
            # redirect_to root_path
        end
    end

    def update
        updated_profile_params = update_array_attributes_in_params(profile_params)
        @profile = Profile.find(params[:id])
        if @profile.update(updated_profile_params)
            flash[:success] = "Profile updated successfully."
            redirect_to root_url
        else
            flash[:danger] = "Profile update failed."
            redirect_to root_url
        end
    end

    def correct_user
        @profile = Profile.find(params[:id])
        @user = User.find(@profile.user_id)
        redirect_to(root_url) unless @user == current_user
    end

    private
        def profile_params
            params.require(:profile).permit(:name, :job_title, :total_experience, :overview, :image,
                :career_highlights, :primary_skills, :secondary_skills,
                :educations_attributes => [ :id, :school, :degree, :description, :start, :end, :_destroy],
                :experiences_attributes => [:id, :company, :position, :start_date, :end_date, :description,
                :projects_attributes => [ :id, :title, :description, :url, :tech_stack, :_destroy]  ]
            )
        end
end
