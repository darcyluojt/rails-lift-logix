class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_up_path_for(_resource)
    new_programme_path
  end

  def after_sign_in_path_for(_resource)
    current_user.programmes.empty? ? new_programme_path : programme_workouts_path(current_user.programmes.last)
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username weight height date_of_birth email
                                                         gender fitness_level fitness_goal profile_image ])
  end
end
