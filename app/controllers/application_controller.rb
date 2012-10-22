class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_data_to_model


  private
  def set_data_to_model
    p current_user
    p "999999999"
    if user_signed_in?
      User.current = current_user
    end
  end

end
