class Users::RegistrationsController < Devise::RegistrationsController
    def send_reset_password_instructions
      current_user.send_reset_password_instructions
      redirect_to edit_user_registration_path, notice: 'Reset password instructions have been sent to your email.'
    end

    protected

    def update_resource(resource, params)
      if params[:password].blank? && params[:password_confirmation].blank?
        resource.update_without_password(params.except(:current_password))
      else
        resource.update(params)
      end
    end
  end
  