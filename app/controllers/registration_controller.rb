class RegistrationController < ApplicationController

    def signup
        @user = User.new
    end
end
