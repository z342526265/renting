class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_data_to_model

  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found

  private
  def set_data_to_model
    if user_signed_in?
      User.current = current_user
    end
  end



  protected

  def render_not_found
    render template: "pages/404", status: 404
  end


end
