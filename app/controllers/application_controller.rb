# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  around_action :set_time_zone, if: :current_user

  private

  def set_time_zone(&)
    Time.use_zone(current_user.time_zone, &)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username profile_image])
  end
end
