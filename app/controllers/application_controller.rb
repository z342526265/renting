class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_data_to_model


  private
  def set_data_to_model
    if user_signed_in?
      User.current = current_user
    end
  end

end
