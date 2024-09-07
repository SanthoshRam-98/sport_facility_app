class ApplicationController < ActionController::Base
    before_action :authenticate_user! # Ensures that users are logged in to access certain actions

    def after_sign_out_path_for(resource_or_scope)
        root_path # Redirect to the root path after logout
    end

    # Customize the path after sign up
    def after_sign_up_path_for(resource_or_scope)
        root_path # Redirect to the root path after sign up
    end


end
