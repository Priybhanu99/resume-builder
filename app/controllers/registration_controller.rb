class RegistrationController < ApplicationController

    def signup
        @user = User.new
        @profile = Profile.new
    end
end
